import 'package:bukizz_retailer/mvvm/models/Auth/RetailerModel.dart';
import 'package:bukizz_retailer/mvvm/views/NavBar/NavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../providers/bottom_nav_bar_provider.dart';
import '../../models/address/AddressModel.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  //email signin using email and password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResult.user!.uid.isNotEmpty) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('retailer')
                .where('email', isEqualTo: email)
                .get();

        RetailerModel retailer = RetailerModel.fromMap(querySnapshot.docs.first.data());

        if (retailer.status == 'inactive') {
          if (context.mounted) {
            AppConstants.showSnackBar(
                context,
                "Your account is inactive. Please contact admin.",
                AppColors.error,
                Icons.error_outline_rounded);
          }
          return;
        }
        AppConstants.retailer = retailer;
        await retailer.saveToSharedPref().then((value) => Navigator.pushNamedAndRemoveUntil(context, MainScreen.route , (route) => false));
        
      } else {
        if (context.mounted) {
          AppConstants.showSnackBar(context, "User Not Signed In ", AppColors.error,
              Icons.error_outline_rounded);
          Navigator.of(context).pop();
        }
      }
      notifyListeners();
    } catch (e) {
      // Handle sign-in errors
      String errorMessage = "An error occurred during sign-in.";

      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'user-not-found') {
          errorMessage = "No user found with this email.";
        } else if(e.code == 'invalid-email') {
            errorMessage = "User Not Signed Up";
        } else if (e.code == 'network-request-failed') {
          errorMessage = "No Internet Connection";
        } else if (e.code == "wrong-password") {
          errorMessage = "Please Enter correct password";
        } else if (e.code == 'too-many-requests') {
          errorMessage = "Too many requests. Try again later.";
        } else if (e.code == 'unknwon') {
          errorMessage = "Unknown Error";
        } else {
          errorMessage = "Error: ${e.message}";
        }
      }

      if (context.mounted) {
        AppConstants.showSnackBar(context, errorMessage, AppColors.error,
            Icons.error_outline_rounded);
      }
      print("Error signing in: $e");
    }
  }

  Future<void> emailSignUp(
      String name,
      String email,
      String phone,
      String gstIn,
      String adhaar,
      String pan,
      Address address,
      List<String> schools,
      String password,
      BuildContext context,
      {String photo = '', String adharImage = '',
      String panImage = ''}) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user!.uid.isNotEmpty) {
        RetailerModel retailer = RetailerModel(
          id: authResult.user!.uid,
          email: email,
          password: RetailerModel.hashPassword(password),
          name: name,
          address: address,
          phone: '',
          photo: '',
          gstin: gstIn,
          pan: pan,
          aadhar: adhaar,
          fcmToken: '',
          status: 'inactive',
          schools: schools,
          panImage: panImage,
          aadharImage: adharImage,
        );
        await retailer.pushToFirebase(context).then((value) => AppConstants.showSnackBar(context, "Registered Successfully", AppColors.green, Icons.check_circle));
        Navigator.of(context).pop();
      } else {
        print("Failed to Login");
      }
    } catch (e) {
      String errorMessage = "An error occurred during sign-up.";

      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          errorMessage = "Email already in use.";
        } else if(e.code == 'invalid-email') {
            errorMessage = "Invalid Email";
        } else if(e.code == 'operation-not-allowed'){
          errorMessage = "Account disabled , Contact Admin";
        } else if(e.code == 'weak-password'){
          errorMessage = "Password is too weak";
        } else if (e.code == 'network-request-failed') {
          errorMessage = "No Internet Connection";
        } else if (e.code == 'too-many-requests') {
          errorMessage = "Too many requests. Try again later.";
        } else if (e.code == 'unknwon') {
          errorMessage = "Unknown Error";
        }else {
          errorMessage = "Error: ${e.message}";
        }
      }
      if (context.mounted) {
        AppConstants.showSnackBar(context, errorMessage, AppColors.error,
            Icons.error_outline_rounded);
      }
      print("Error signing up: $e");
    }
  }
}
