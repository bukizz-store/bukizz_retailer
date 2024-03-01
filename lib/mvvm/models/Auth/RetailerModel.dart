import 'dart:convert';

import 'package:bukizz_retailer/constants/strings.dart';
import 'package:bukizz_retailer/mvvm/models/address/AddressModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';

class RetailerModel{
  String id;
  String name;
  Address address;
  String phone;
  String email;
  String password;
  String image;
  String gstin;
  String pan;
  String aadhar;
  String fcmToken;
  String status;

  RetailerModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.gstin,
    required this.pan,
    required this.aadhar,
    required this.fcmToken,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address.toMap(),
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
      'gstin': gstin,
      'pan': pan,
      'aadhar': aadhar,
      'fcmToken': fcmToken,
      'status': status,
    };
  }

  factory RetailerModel.fromMap(Map<String, dynamic> map) {
    return RetailerModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: Address.fromMap(map['address']),
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      image: map['image'] ?? '',
      gstin: map['gstin'] ?? '',
      pan: map['pan'] ?? '',
      aadhar: map['aadhar'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
      status: map['status'] ?? '',
    );
  }

  // Hash the password using SHA-256
  static String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> pushToFirebase(BuildContext context) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance
          .collection(AppString.collectionRetailer)
          .where('email', isEqualTo: email)
          .get();

      var fire = FirebaseDatabase.instance.ref().child('token').child(id);
      await fire.set({'token': AppConstants.fcmToken});

      if (querySnapshot.docs.isEmpty) {
        // If no document with the same email exists, add a new document
        await FirebaseFirestore.instance.collection(AppString.collectionRetailer).doc(id).set(toMap());

      } else {
        AppConstants.showSnackBar(context, "Already Registered !", AppColors.green, Icons.error_outline_rounded);
      }
      AppConstants.retailer = RetailerModel.fromMap(toMap());

      // AppConstants.userData = MainUserDetails.fromMap(toMap());
      // print(toMap());

    } catch (e) {
      print('Error pushing user data to Firebase: $e');
    }

  }

  Future<void> saveToSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppString.collectionRetailer, jsonEncode(toMap()));
  }

  Future<void> fetchFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(AppString.collectionRetailer);
    if (data != null) {
      AppConstants.retailer = RetailerModel.fromMap(jsonDecode(data));
    }
  }

}