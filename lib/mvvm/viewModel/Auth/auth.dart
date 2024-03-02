import 'package:bukizz_retailer/mvvm/models/Auth/RetailerModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
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

      RetailerModel retailer = RetailerModel(
        id: authResult.user!.uid,
        email: email,
        password: RetailerModel.hashPassword(password),
        name: '',
        address: Address(
          city: '',
          state: '',
          pinCode: '',
          street: '',
          shopNo: '',
        ),
        phone: '',
        image: '',
        gstin: '',
        pan: '',
        aadhar: '',
        fcmToken: '',
        status: '',
      );

      if (authResult.user!.uid.isNotEmpty) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('retailer')
                .where('email', isEqualTo: email)
                .get();

        retailer = RetailerModel.fromMap(querySnapshot.docs.first.data());

        if (retailer.status == 'inactive') {
          if (context.mounted) {
            AppConstants.showSnackBar(
                context,
                "Your account is inactive. Please contact admin.",
                AppColors.error,
                Icons.error_outline_rounded);
            Navigator.of(context).pop();
          }
          return;
        }

        // Navigator.pushNamed(context, )

        // retailer.id = authResult.user!.uid;
        AppConstants.retailer = retailer;

        await retailer.pushToFirebase(context);
        await retailer.saveToSharedPref();
      } else {
        if (context.mounted) {
          AppConstants.showSnackBar(context, "Failed to Login", AppColors.error,
              Icons.error_outline_rounded);
          Navigator.of(context).pop();
        }
      }
      notifyListeners();
    } catch (e) {
      // Handle sign-in errors
      String errorMessage = "An error occurred during sign-in.";

      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = "No user found with this email.";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Incorrect password.";
        } else {
          errorMessage = "Error: ${e.message}";
        }
      }

      if (context.mounted) {
        AppConstants.showSnackBar(context, errorMessage, AppColors.error,
            Icons.error_outline_rounded);
        Navigator.of(context).pop();
      }
      print("Error signing in: $e");
    }
  }

  Future<void> emailSignUp(
      String name,
      String email,
      String gstin,
      String adhaar,
      String pan,
      Address address,
      List<String> schools,
      String password,
      BuildContext context,
      {String adharImage = '',
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
          image: '',
          gstin: gstin,
          pan: pan,
          aadhar: adhaar,
          fcmToken: '',
          status: 'inactive',
        );
        await retailer
            .pushToFirebase(context).then((value) => AppConstants.showSnackBar(context, "Registered Successfully", AppColors.green, Icons.check_circle));
      } else {
        print("Failed to Login");
      }
    } catch (e) {
      print(e);
    }
  }
}
