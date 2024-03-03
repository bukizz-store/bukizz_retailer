import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/utils/widgets/spacing/spacing.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';



class OrderTabs extends StatefulWidget {
  const OrderTabs({super.key});

  @override
  State<OrderTabs> createState() => _OrderTabsState();
}

class _OrderTabsState extends State<OrderTabs> {
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Scaffold(
       
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              SizedBox(
                width: dimensions.width10*34.5,
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Facing any issue? Feel free to call our',
                        style: TextStyle(
                          color: Color(0xFF444444),
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: Color(0xFF00579E),
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'Customer Service',
                        style: TextStyle(
                          color: Color(0xFF00579E),
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: ' for assitance',
                        style: TextStyle(
                          color: Color(0xFF444444),
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              Container(
                margin: EdgeInsets.only(bottom: dimensions.width24),
                padding: EdgeInsets.symmetric(horizontal: dimensions.width10*2,vertical: dimensions.height10*2),
                color: Colors.white,
                width: dimensions.screenWidth,
                height: dimensions.height10*10.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: '#12345', fontSize: 16,fontWeight: FontWeight.w700,),
                    SizedBox(height: dimensions.height10*1.2,),
                    SizedBox(
                      width: dimensions.width10*19,
                      child: const Text(
                        'English Book Set - Wisdom World School - Class 1st',
                        style: TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                ),
                SizedBox(height: dimensions.height10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: 'Status:', fontSize: 12,color: AppColors.lightTextColor,fontWeight: FontWeight.w400,),
                    SizedBox(width: 4,),
                    ReusableText(text: 'Processed', fontSize: 12,color: Color(0xFF058FFF),)
                  ],
                )
              ],
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
