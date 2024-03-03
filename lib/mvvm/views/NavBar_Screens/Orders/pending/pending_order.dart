import 'package:bukizz_retailer/constants/constants.dart';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/mvvm/models/order/orders.dart';
import 'package:bukizz_retailer/mvvm/viewModel/orders/orders.dart' as order;
import 'package:bukizz_retailer/mvvm/views/NavBar_Screens/Orders/Bill/bill_screen.dart';
import 'package:bukizz_retailer/utils/widgets/spacing/spacing.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/colors.dart';
import '../../DashBBoard_Screen.dart';

class PendingOrderTabs extends StatefulWidget {
  const PendingOrderTabs({super.key});

  @override
  State<PendingOrderTabs> createState() => _PendingOrderTabsState();
}

class _PendingOrderTabsState extends State<PendingOrderTabs> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Consumer<order.Order>(builder: (context , orderData , child){
      var pendingOrders = orderData.orders.where((element) => element.status == 'Processed').toList();
      var packedOrders = orderData.orders.where((element) => element.status == 'Packed').toList();
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
                  width: 50.w,
                  height: 28.sp,

                  decoration: ShapeDecoration(
                    color: Color(0xFFF5FAFF),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFF00579E),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),

                  child: Container(
                    width: 60.w,
                    height: 10.h,
                    padding: EdgeInsets.symmetric(horizontal: 5 , vertical: 5),
                    decoration: ShapeDecoration(
                      color: Color(0xFFF5FAFF),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF00579E),
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),

                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true, // Add this line
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(right: 2.w),
                              width: 23.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  color: selectedIndex!=index? Colors.transparent:AppColors.tabcolor,
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: ReusableText(text: index==0?'Unpacked':'Packed', fontSize: 12,color: selectedIndex!=index?AppColors.forgotPasswordTextColor:AppColors.white,fontWeight: FontWeight.w600,),
                            ),
                          );
                        }
                    ),
                  ),

                ),
                20.verticalSpace,
                if(selectedIndex==0)
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: pendingOrders.length,
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
                                    ReusableText(text: "#${pendingOrders[index].orderId.split('-')[0]}", fontSize: 16,fontWeight: FontWeight.w700,),
                                    Column(
                                      children: [
                                        ReusableText(text: 'Amount', fontSize: 12,color: AppColors.lightTextColor,),
                                        20.verticalSpace,
                                        ReusableText(text: '₹ ${pendingOrders[index].saleAmount}', fontSize: 16)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: dimensions.height10*1.2,),
                                SizedBox(
                                  width: dimensions.width10*19,
                                  child: Text(
                                    '${pendingOrders[index].cartData.keys.first}',
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
                                    ReusableText(text: pendingOrders[index].status, fontSize: 12,color: Color(0xFF058FFF),)
                                  ],
                                ),
                                20.verticalSpace,
                                InkWell(
                                  onTap: (){
                                    showCustomAboutDialog(context , orderData.orders[index]);
                                    return;
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

                if(selectedIndex==1)
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: packedOrders.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              context.read<order.Order>().setSelectedOrder(packedOrders[index]);
                              Navigator.push(context, MaterialPageRoute(builder: (_) => BillScreen()));
                            },
                            child: Container(
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
                                      ReusableText(text: '#${packedOrders[index].orderId.split("-")[0]}', fontSize: 16,fontWeight: FontWeight.w700,),
                                      Column(
                                        children: [
                                          ReusableText(text: 'Amount', fontSize: 12,color: AppColors.lightTextColor,),
                                          20.verticalSpace,
                                          ReusableText(text: '₹ ${packedOrders[index].saleAmount}', fontSize: 16)
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: dimensions.height10*1.2,),
                                  SizedBox(
                                    width: dimensions.width10*19,
                                    child: Text(
                                      '${packedOrders[index].cartData.keys.first}',
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
                                      ReusableText(text: packedOrders[index].status, fontSize: 12,color: Color(0xFF058FFF),)
                                    ],
                                  ),

                                ],
                              ),
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
    },
    );

  }
  void showCustomAboutDialog(BuildContext context  , OrderModel orderData) {
    Dimensions dimensions=Dimensions(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
            title: Center(
              child: Column(
                children: [
                  ReusableText(text: 'Are You ready to pack this order', fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xFF121212),),
                  SizedBox(height: dimensions.height10*2,),
                  const SizedBox(
                    width: 294,
                    child: Text(
                      'Please ensure all items are checked and ready for shipment.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF444444),
                        fontSize: 12,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            content:Container(
              // width: dimensions.width10*35.6,
              height: dimensions.height10*8.5,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: dimensions.width10*11.5,
                      height: dimensions.height10*3.5,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.50, color: Color(0xFF00579E)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: ReusableText(text: 'Cancel', fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF00579E),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      FirebaseFirestore.instance.collection('orderDetails').doc(orderData.orderId).update({
                        'status':'Packed'
                      }).then((value) {
                        context.read<order.Order>().setSelectedOrder(orderData);
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BillScreen()));
                      }).catchError((e){
                        AppConstants.showSnackBar(context, e.toString(), AppColors.error, Icons.error_outline_rounded);
                      });
                    },
                    child: Container(
                      width: dimensions.width10*11.5,
                      height: dimensions.height10*3.5,
                      decoration: ShapeDecoration(
                        color: Color(0xFF058FFF),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Center(
                        child: ReusableText(text: 'Pack', fontSize: 14,fontWeight: FontWeight.w600, color:Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
            )

        );

      },
    );
  }
}


