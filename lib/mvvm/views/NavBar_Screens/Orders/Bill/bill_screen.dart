import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/utils/widgets/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utils/widgets/text and textforms/Reusable_text.dart';

class BillScreen extends StatefulWidget {
  static const route = '/bill';
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            15.verticalSpace,
            Container(
              // margin: EdgeInsets.only(bottom: dimensions.width24),
              padding: EdgeInsets.symmetric(horizontal: dimensions.width10*2,vertical: dimensions.height10*2),
              color: Colors.white,
              width: dimensions.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(text: '#12345', fontSize: 16,fontWeight: FontWeight.w700,),
                      Column(
                        children: [
                          ReusableText(text: 'Amount', fontSize: 12,color: AppColors.lightTextColor,),
                          20.verticalSpace,
                          ReusableText(text: '₹ 1700', fontSize: 16)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: dimensions.height10*1.2,),
                  SizedBox(
                    width: dimensions.width10*19,
                    child: const Text(
                      'Dr. Vscc Sharda Nagar',
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
                      ReusableText(text: 'Packed', fontSize: 12,color: Color(0xFF058FFF),)
                    ],
                  ),

                ],
              ),

           ),
            Container(
              width: dimensions.screenWidth,
              height: 1,
              color: Colors.grey.withOpacity(0.4),
            ),
            Container(
              width: dimensions.screenWidth,
              padding: EdgeInsets.symmetric(horizontal: dimensions.width10*2,vertical: dimensions.height10*2),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(text: 'Invoice', fontSize: 20,fontWeight: FontWeight.w700),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 30.w,
                          height: 24.sp,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.50, color: Color(0xFF00579E)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              ReusableText(text: 'Download', fontSize: 14,color: AppColors.buttonColor,),
                              Icon(Icons.download,color: AppColors.buttonColor,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  SizedBox(
                    width: dimensions.width10*34.5,
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'SHIP TO  \n',
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 12,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Stuti Awasthi  \n137, Shikshak Nagar ,Kalyanpur kala(Near Vishwas Hospital, Purana Shivli  Road),Kanpur Nagar. \n208017 Kanpur Nagar UP \n75238 30250',
                            style: TextStyle(
                              color: Color(0xFF7A7A7A),
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(text: 'Price (2 items)', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
                          ReusableText(text: '₹ 1750', fontSize: 12,fontWeight: FontWeight.w500,)
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(text: 'Discount', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
                          ReusableText(text: '- ₹175', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.green),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(text: 'Delivery Charges', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
                          ReusableText(text: '₹ 40', fontSize: 12,fontWeight: FontWeight.w500,)
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(text: 'Total Amount', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
                          ReusableText(text: '₹ 1720', fontSize: 12,fontWeight: FontWeight.w500,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
