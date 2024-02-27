import 'package:bukizz_retailer/constants/colors.dart';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/mvvm/views/Auth/forgotPassword.dart';
import 'package:bukizz_retailer/utils/widgets/buttons/Reusable_Button.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_TextForm.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/textformAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SignInScreen extends StatefulWidget {
  static const route = '/signin';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    Dimensions dimensions=Dimensions(context);
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: dimensions.width24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: dimensions.height36*2,),
              Center(
                child: Container(
                  width: 150,
                  height: 51,
                  child: SvgPicture.asset('assets/logo.svg'),
                ),
              ),
              SizedBox(height: dimensions.height24*2,),
              ReusableText(text: 'Login', fontSize: 24,color: AppColors.black,fontWeight: FontWeight.w700,),
              SizedBox(height: dimensions.height16,),
              ReusableText(text: 'Enter your email and password to continue', fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.lightTextColor,),
              SizedBox(height: dimensions.height36,),
              CustomTextForm(width: 345, height: 46, controller: emailController, hintText: 'Enter your Email', labelText: 'Email', isPasswordType: false,),
              SizedBox(height: dimensions.height24,),
              CustomTextForm(width: 345, height: 46, controller: passwordController, hintText: 'Enter your password', labelText: 'Password', isPasswordType: true,),
              TextButton(onPressed: (){Navigator.pushNamed(context, ForgotPasswordScreen.route);}, child: ReusableText(text: 'Forgot Password',fontSize: 14,color: AppColors.forgotPasswordTextColor,)),
              SizedBox(height: dimensions.height24,),
              ReusableElevatedButton(width: dimensions.width10*34.5, height: dimensions.height10*5.4, onPressed: (){}, buttonText: 'Login'),
              SizedBox(height: dimensions.height48,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: dimensions.width10*9.6,
                    height: 1,
                    color: Colors.black26,
                  ),
                  ReusableText(text: 'New to Bukizz Shop?', fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.lightTextColor,),
                  Container(
                    width: dimensions.width10*9.6,
                    height: 1,
                    color: Colors.black26,
                  ),
                ],
              ),
              SizedBox(height: dimensions.height16*2,),
              ReusableElevatedButton(width: dimensions.width10*34.5, height: dimensions.height10*5.4, onPressed: (){}, buttonText: 'Create a new account',buttonColor: Colors.white,textColor: AppColors.black.withOpacity(0.8),shadowColor: AppColors.lightTextColor.withOpacity(0.2)),
            ],
          ),
        ),
      )
    );
  }
}
