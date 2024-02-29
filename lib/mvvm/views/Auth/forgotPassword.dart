import 'package:bukizz_retailer/constants/colors.dart';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/mvvm/views/ContactUs/contact_us.dart';
import 'package:bukizz_retailer/utils/widgets/buttons/Reusable_Button.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/textformAddress.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ForgotPasswordScreen extends StatefulWidget {
  static const route='/forgot';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                    width: dimensions.width10*15,
                    height: dimensions.height10*5.1,
                    child: SvgPicture.asset('assets/logo.svg'),
                  ),
                ),
                SizedBox(height: dimensions.height24*2,),
                ReusableText(text:     'Password assistance', fontSize: 24,color: AppColors.black,fontWeight: FontWeight.w700,),
                SizedBox(height: dimensions.height16,),
                const SizedBox(
                  width: 345,
                  child: Text(
                    'Enter your email address associated with Bukizzz Shop account.',
                    style: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: dimensions.height36,),
                CustomTextForm(width: dimensions.width10*34.5, height: dimensions.height10*4.6, controller: emailController, hintText: 'Enter your Email', labelText: 'Email', isPasswordType: false,),
                SizedBox(height: dimensions.height24,),


                ReusableElevatedButton(width: dimensions.width10*34.5, height: dimensions.height10*5.4, onPressed: (){}, buttonText: 'Continue'),
                SizedBox(height: dimensions.height48,),
                ReusableText(text: 'Still facing any issue?', fontSize: 16,fontWeight: FontWeight.w700,),
                SizedBox(height: dimensions.height8,),
                 SizedBox(
                  width: 345,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Contact ',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Customer Service',
                          style: const TextStyle(
                            color: Color(0xFF058FFF),
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            height: 0,

                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, ContactUsScreen.route);
                            },
                        ),
                        const TextSpan(
                          text: ' for help in restoring your account',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
