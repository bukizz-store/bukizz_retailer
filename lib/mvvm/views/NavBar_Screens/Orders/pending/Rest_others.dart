import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/mvvm/viewModel/orders/orders.dart';
import 'package:bukizz_retailer/utils/widgets/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utils/widgets/text and textforms/Reusable_text.dart';


class OrderTabs extends StatefulWidget {
  final String status;
  const OrderTabs({super.key , required this.status});

  @override
  State<OrderTabs> createState() => _OrderTabsState();
}

class _OrderTabsState extends State<OrderTabs> {
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Consumer<Order>(builder: (context , orderData , child){
      var orders = orderData.orders.where((element) => element.status == widget.status).toList();
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 500,
                  child: ListView.builder(
                      itemCount: orders.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.only(bottom: dimensions.width24),
                          padding: EdgeInsets.symmetric(horizontal: dimensions.width10*2,vertical: dimensions.height10*2),
                          color: Colors.white,
                          width: dimensions.screenWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ReusableText(text: '#${orders[index].orderId.split('-')[0]}', fontSize: 16,fontWeight: FontWeight.w700,),
                                  Column(
                                    children: [
                                      ReusableText(text: 'Amount', fontSize: 12,color: AppColors.lightTextColor,),
                                      20.verticalSpace,
                                      ReusableText(text: '₹ ${orders[index].saleAmount}', fontSize: 16)
                                    ],
                                  )
                                ],
                              ),
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
                                  ReusableText(text: orders[index].status, fontSize: 12,color: Color(0xFF058FFF),)
                                ],
                              ),
                              20.verticalSpace,
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100.w,
                                  height: 25.sp,
                                  decoration: ShapeDecoration(

                                    shadows: const [
                                      BoxShadow(
                                        color: AppColors.tabcolor,
                                        offset:Offset(0,4),

                                      )
                                    ],
                                    color: AppColors.buttonColor,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0.50, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(6),
                                    ),

                                  ),

                                  child: ReusableText(text: 'Pack Order',fontSize: 16,color: AppColors.white,),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),



              ],
            ),
          ),
        ),
      );
    });
  }
}
