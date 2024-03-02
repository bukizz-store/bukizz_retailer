import 'dart:io';
import 'dart:typed_data';

import 'package:bukizz_retailer/constants/colors.dart';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/mvvm/viewModel/Auth/auth.dart';
import 'package:bukizz_retailer/utils/widgets/buttons/Reusable_Button.dart';
import 'package:bukizz_retailer/utils/widgets/imagePicker.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_TextForm.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/textformAddress.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  TextEditingController schoolController = TextEditingController();

  String photoURL = '';
  String adhaarURL = '';
  String panURL = '';

  Future<String> getImage(String fileName) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null)
      {
        try {
          final File image = File(pickedFile!.path);
          final file = basename(image.path);
          var data = await FirebaseStorage.instance
              .ref('Retailer/$fileName/$file')
              .putFile(image);
          return data.ref.getDownloadURL();
        } catch (e) {
          print('Error uploading image to Firebase storage: $e');
        }
      }
    return '';
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
              ReusableText(text: 'Upload Your Photo', fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.black,),
              SizedBox(height: dimensions.height8,),
              photoURL == '' ?imagePicker(
                infoText: 'Upload files',
                onTap: () async{
                  photoURL = await getImage('photo');
                  setState(() async{
                  });
                  print(photoURL);
                },
              ) : Center(child: Image.network(photoURL ,width: 40.w , height: 20.h,)),
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
              ReusableText(text: 'Upload Your Aadhar', fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.black,),
              SizedBox(height: dimensions.height8,),
              adhaarURL == '' ?imagePicker(
                infoText: 'Upload files',
                onTap: () async{
                    adhaarURL = await getImage('adhaar');
                  setState((){
                  });
                },
              ): Center(child: Image.network(adhaarURL ,width: 40.w , height: 20.h,)),
              SizedBox(height: dimensions.height16,),
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
              ReusableText(text: 'Upload Your PAN Card', fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.black,),
              SizedBox(height: dimensions.height8,),
              panURL == '' ?imagePicker(
                infoText: 'Upload files',
                onTap: () async{
                    panURL = await getImage('pan');
                  setState((){
                  });
                },
              ) : Center(child: Image.network(panURL ,width: 40.w , height: 20.h,)),
              SizedBox(height: dimensions.height16,),
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
              ReusableText(text: 'Add Schools', fontSize: 14,fontWeight: FontWeight.w600,),
              SizedBox(height: dimensions.height16,),
              CustomTextForm(width: dimensions.width342,
                  height: dimensions.height48,
                  controller: schoolController, hintText: 'Add Schools',
                  labelText: 'Add Schools', isPasswordType: false,
              ),
              SizedBox(height: dimensions.height16,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  width: dimensions.width10*12.5,
                  height: dimensions.height10*3.4,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF00579E)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add,color: AppColors.forgotPasswordTextColor,size: 20,),
                      ReusableText(text: 'Add Schools', fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.forgotPasswordTextColor,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: dimensions.height16),
              ReusableElevatedButton(
                  width: dimensions.width342,
                  height: dimensions.height57,
                  onPressed: () {
                    // context.read<AuthViewModel>().emailSignUp(nameController.text, emailController.text, gstin, adhaar, pan, address, schools, password, context)
                  },
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
                  onPressed: () {

                  },
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
