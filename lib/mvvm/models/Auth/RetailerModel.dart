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
  String photo;
  String panImage;
  String aadharImage;
  String gstin;
  String pan;
  String aadhar;
  String fcmToken;
  String status;
  List<dynamic> schools ;

  RetailerModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
    required this.photo,
    required this.gstin,
    required this.pan,
    required this.aadhar,
    required this.fcmToken,
    required this.status,
    required this.schools,
    required this.panImage,
    required this.aadharImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address.toMap(),
      'phone': phone,
      'email': email,
      'password': password,
      'photo': photo,
      'gstin': gstin,
      'pan': pan,
      'aadhar': aadhar,
      'fcmToken': fcmToken,
      'status': status,
      'schools': schools,
      'panImage': panImage,
      'aadharImage': aadharImage,
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
      photo: map['photo'] ?? '',
      gstin: map['gstin'] ?? '',
      pan: map['pan'] ?? '',
      aadhar: map['aadhar'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
      status: map['status'] ?? '',
      schools: map['schools'] ?? [],
      panImage: map['panImage'] ?? '',
      aadharImage: map['aadharImage'] ?? '',
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

      if (querySnapshot.docs.isEmpty) {
        // If no document with the same email exists, add a new document
        await FirebaseFirestore.instance.collection(AppString.collectionRetailer).doc(id).set(toMap());

      } else {
        var fire = FirebaseDatabase.instance.ref().child('token').child(id);
        await fire.set({'token': AppConstants.fcmToken});
      }
      AppConstants.retailer = RetailerModel.fromMap(toMap());
    } catch (e) {
      print('Error pushing user data to Firebase: $e');
    }
  }

  Future<void> saveToSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppString.collectionRetailer, jsonEncode(toMap()));
    prefs.setBool('isLogin', true);
  }

  static Future<void> fetchFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(AppString.collectionRetailer) ?? '';
    AppConstants.isLogin = prefs.getBool('isLogin') ?? false;
    if (data.isNotEmpty) {
      AppConstants.retailer = RetailerModel.fromMap(jsonDecode(data));
    }
  }

}