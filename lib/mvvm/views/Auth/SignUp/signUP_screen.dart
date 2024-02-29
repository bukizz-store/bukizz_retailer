import 'dart:io';
import 'dart:typed_data';

import 'package:bukizz_retailer/constants/colors.dart';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/utils/widgets/buttons/Reusable_Button.dart';
import 'package:bukizz_retailer/utils/widgets/imagePicker.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_TextForm.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/textformAddress.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SignUpScreen extends StatefulWidget {
  static const route = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  Future<void> getImage(String fileName) async {
    final ImagePicker picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    final File image = File(pickedFile!.path);
    final file = basename(image.path);
    try {
      await FirebaseStorage.instance
          .ref('Retailer/$file')
          .putFile(image)
          .then((element) => print("Element Inserted"));
      print('Image uploaded successfully.');
    } catch (e) {
      print('Error uploading image to Firebase storage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimensions.width24, vertical: dimensions.height8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: dimensions.height36 * 2,
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 51,
                  child: SvgPicture.asset('assets/logo.svg'),
                ),
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              ReusableText(
                text: 'Create New Account',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              ReusableText(
                text: 'Enter all details to setup your Bukizz Shop',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightTextColor,
              ),
              SizedBox(
                height: dimensions.height36,
              ),
              imagePicker(
                infoText: 'Upload files',
                onTap: () {
                  getImage('retailer1');
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextForm(
                  width: dimensions.width342,
                  height: dimensions.height48,
                  controller: nameController,
                  hintText: 'Full Name',
                  labelText: 'Full Name',
                  isPasswordType: false),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                  width: dimensions.width342,
                  height: dimensions.height48,
                  controller: emailController,
                  hintText: 'Email',
                  labelText: 'Email',
                  isPasswordType: false),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                  width: dimensions.width342,
                  height: dimensions.height48,
                  controller: aadharController,
                  hintText: 'Aadhar Card Number',
                  labelText: 'Aadhar Card Number',
                  isPasswordType: false),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                  width: dimensions.width342,
                  height: dimensions.height48,
                  controller: panController,
                  hintText: 'PAN Number',
                  labelText: 'PAN Number',
                  isPasswordType: false),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                  width: dimensions.width342,
                  height: dimensions.height48,
                  controller: cityController,
                  hintText: 'City',
                  labelText: 'City',
                  isPasswordType: false),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                  width: dimensions.width342,
                  height: dimensions.height48,
                  controller: addressController,
                  hintText: 'Address of shop',
                  labelText: 'Address of shop',
                  isPasswordType: false),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                  width: dimensions.width342,
                  height: dimensions.height48,
                  controller: pinController,
                  hintText: 'Pincode',
                  labelText: 'Pincode',
                  isPasswordType: false),
              SizedBox(
                height: dimensions.height24,
              ),
              ReusableElevatedButton(
                  width: dimensions.width342,
                  height: dimensions.height57,
                  onPressed: () {},
                  buttonText: 'Create Account'),
              SizedBox(
                height: dimensions.height105,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: dimensions.width10 * 9.6,
                    height: 1,
                    color: Colors.black26,
                  ),
                  ReusableText(
                    text: 'New to Bukizz Shop?',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                  Container(
                    width: dimensions.width10 * 9.6,
                    height: 1,
                    color: Colors.black26,
                  ),
                ],
              ),
              SizedBox(
                height: dimensions.height16 * 2,
              ),
              ReusableElevatedButton(
                  width: dimensions.width10 * 34.5,
                  height: dimensions.height10 * 5.4,
                  onPressed: () {},
                  buttonText: 'Login',
                  buttonColor: Colors.white,
                  textColor: AppColors.black.withOpacity(0.8),
                  shadowColor: AppColors.lightTextColor.withOpacity(0.2)),
              SizedBox(
                height: dimensions.height57,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
