import 'dart:io';
import 'dart:typed_data';

import 'package:bukizz_retailer/constants/colors.dart';
import 'package:bukizz_retailer/constants/constants.dart';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/mvvm/viewModel/Auth/auth.dart';
import 'package:bukizz_retailer/utils/widgets/buttons/Reusable_Button.dart';
import 'package:bukizz_retailer/utils/widgets/imagePicker.dart';
import 'package:bukizz_retailer/utils/widgets/spacing/spacing.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_TextForm.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/textformAddress.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../models/address/AddressModel.dart';

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
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String photoURL = '';
  String adhaarURL = '';
  String panURL = '';
  List<String> schools = [];
  String selectedValue = 'Yes';

  Future<String> getImage(String fileName) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
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
              ReusableText(
                text: 'Upload Your Photo',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              SizedBox(
                height: dimensions.height8,
              ),
              photoURL == ''
                  ? imagePicker(
                      infoText: 'Upload files',
                      onTap: () async {
                        photoURL = await getImage('photo');
                        setState(() {});
                        print(photoURL);
                      },
                    )
                  : Center(
                      child: Image.network(
                      photoURL,
                      width: 40.w,
                      height: 20.h,
                    )),
              SizedBox(
                height: 16,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: nameController,
                hintText: 'Full Name',
                labelText: 'Full Name',
                isPasswordType: false,
                type: InputType.all,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: emailController,
                hintText: 'Email',
                labelText: 'Email',
                isPasswordType: false,
                type: InputType.email,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: passController,
                hintText: 'Password',
                labelText: 'Password',
                isPasswordType: true,
                type: InputType.email,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: mobileController,
                hintText: 'Mobile Number*(required)',
                labelText: 'Mobile',
                isPasswordType: false,
                type: InputType.phone,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: gstController,
                hintText: 'GST Number',
                labelText: 'GST Number',
                isPasswordType: false,
                type: InputType.all,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: aadharController,
                hintText: 'Aadhar Card Number',
                labelText: 'Aadhar Card Number',
                isPasswordType: false,
                type: InputType.all,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              ReusableText(
                text: 'Upload Your Aadhar',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              SizedBox(
                height: dimensions.height8,
              ),
              adhaarURL == ''
                  ? imagePicker(
                      infoText: 'Upload files',
                      onTap: () async {
                        adhaarURL = await getImage('adhaar');
                        setState(() {});
                      },
                    )
                  : Center(
                      child: Image.network(
                      adhaarURL,
                      width: 40.w,
                      height: 20.h,
                    )),
              SizedBox(
                height: dimensions.height16,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: panController,
                hintText: 'PAN Number',
                labelText: 'PAN Number',
                isPasswordType: false,
                type: InputType.all,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              ReusableText(
                text: 'Upload Your PAN Card',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              SizedBox(
                height: dimensions.height8,
              ),
              panURL == ''
                  ? imagePicker(
                      infoText: 'Upload files',
                      onTap: () async {
                        panURL = await getImage('pan');
                        setState(() {});
                      },
                    )
                  : Center(
                      child: Image.network(
                      panURL,
                      width: 40.w,
                      height: 20.h,
                    )),
              SizedBox(
                height: dimensions.height16,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: pinController,
                hintText: 'Pin Code',
                labelText: 'Pin Code',
                type: InputType.pinCode,
                isPasswordType: false,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextForm(
                    width: dimensions.width342 / 2.2,
                    height: dimensions.height10 * 4.3,
                    controller: stateController,
                    hintText: 'State',
                    labelText: 'State',
                    isPasswordType: false,
                    type: InputType.all,
                  ),
                  CustomTextForm(
                    width: dimensions.width342 / 2.2,
                    height: dimensions.height10 * 4.3,
                    controller: cityController,
                    hintText: 'City',
                    labelText: 'City',
                    isPasswordType: false,
                    type: InputType.all,
                  ),
                ],
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: addressController,
                hintText: 'Shop No./Building Name *(Required)',
                labelText: 'Shop No./Building Name *(Required)',
                isPasswordType: false,
                type: InputType.all,
              ),
              SizedBox(
                height: dimensions.height24,
              ),
              CustomTextForm(
                width: dimensions.width342,
                height: dimensions.height48,
                controller: areaController,
                hintText: 'Road name, Area, Colony (Required) *',
                labelText: 'Road name, Area, Colony (Required) *',
                isPasswordType: false,
                type: InputType.all,
              ),
              30.verticalSpace,
              ReusableText(text: "Are you authorized from any school?" , fontSize: 16,fontWeight: FontWeight.w400,),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 'Yes',
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                  const Text('Yes'),
                  Radio(
                    value: 'No',
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                  Text('No'),
                ],
              ),
              15.verticalSpace,
              if(selectedValue=='Yes')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: 'Add Schools',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: dimensions.height16,
                  ),
                  CustomTextForm(
                      width: dimensions.width342,
                      height: dimensions.height48,
                      controller: schoolController,
                      hintText: 'Add Schools',
                      labelText: 'Add Schools',
                      isPasswordType: false,
                      type: InputType.all),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                      if(schoolController.text.isEmpty){
                        return;
                      }
                      schools.add(schoolController.text);
                      schoolController.clear();
                      setState(() {

                      });
                    },
                    child: Container(
                      width: dimensions.width10 * 12.5,
                      height: dimensions.height10 * 3.4,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF00579E)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.forgotPasswordTextColor,
                            size: 20,
                          ),
                          ReusableText(
                            text: 'Add Schools',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.forgotPasswordTextColor,
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                      height: schools.length * 11.h,
                      child: ListView.builder(
                          itemCount: schools.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: dimensions.width342,
                                height: dimensions.height48,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border:
                                    Border.all(color: Colors.grey, width: 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schools[index] ,style: GoogleFonts.nunito(fontSize: 15),),
                                    IconButton(
                                      alignment: Alignment.center,
                                      onPressed: () {
                                        schools.removeAt(schools.indexOf(schools[index]));
                                        setState(() {
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever_outlined,
                                        color: AppColors.red,
                                        size: 30,
                                      ),
                                    )
                                  ],
                                ));
                          })),
                ],
              ),


              SizedBox(height: dimensions.height16),
              ReusableElevatedButton(
                  width: dimensions.width342,
                  height: dimensions.height57,
                  onPressed: () {
                  Address address = Address(street: areaController.text, city: cityController.text, state: stateController.text, pinCode: pinController.text, shopNo: addressController.text);

                    context.read<AuthViewModel>().emailSignUp(nameController.text, emailController.text, mobileController.text, gstController.text, aadharController.text, panController.text, address, schools,passController.text, context);
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
