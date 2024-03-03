import 'package:bukizz_retailer/constants/colors.dart';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/constants/images.dart';
import 'package:bukizz_retailer/mvvm/viewModel/orders/orders.dart';
import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

List buttonName=['All','New Orders','Status Update','Product'];

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Consumer<Order>(builder: (context , orderData , child){
      return Scaffold(
        appBar: AppBar(
          title: ReusableText(text: 'Dashboard', fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.black,),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: dimensions.width24,vertical: dimensions.height16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            width: dimensions.width10*15,
                            height: dimensions.height10*15,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x2600579E),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:10),
                                  height: dimensions.height10*7,
                                  width: dimensions.width10*7,
                                  child: SvgPicture.asset(AppImage.dashboard1),
                                ),
                                ReusableText(text: 'Total Orders', fontSize: 16,fontWeight: FontWeight.w400,),
                                SizedBox(height: dimensions.height24,),
                                ReusableText(text: orderData.orders.length.toString(), fontSize: 16)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: dimensions.width10*15,
                            height: dimensions.height10*15,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x2600579E),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:10),
                                  height: dimensions.height10*7,
                                  width: dimensions.width10*7,
                                  child: SvgPicture.asset(AppImage.dashboard2),
                                ),
                                ReusableText(text: 'Total Sales', fontSize: 16,fontWeight: FontWeight.w400,),
                                SizedBox(height: dimensions.height24,),
                                ReusableText(text: '₹ 40000', fontSize: 16)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: dimensions.height10*2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: dimensions.width10*15,
                            height: dimensions.height10*15,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x2600579E),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:10),
                                  height: dimensions.height10*7,
                                  width: dimensions.width10*7,
                                  child: SvgPicture.asset(AppImage.dashboard3),
                                ),
                                ReusableText(text: 'Pending Order', fontSize: 16,fontWeight: FontWeight.w400,),
                                SizedBox(height: dimensions.height24,),
                                ReusableText(text: orderData.orders.where((element) => element.status == "Processed").length.toString(), fontSize: 16)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: dimensions.width10*15,
                            height: dimensions.height10*15,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x2600579E),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:10),
                                  height: dimensions.height10*7,
                                  width: dimensions.width10*7,
                                  child: SvgPicture.asset(AppImage.dashboard4),
                                ),
                                ReusableText(text: 'All Product', fontSize: 16,fontWeight: FontWeight.w400,),
                                SizedBox(height: dimensions.height24,),
                                ReusableText(text: '40', fontSize: 16)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: dimensions.height10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(text: 'Notifications', fontSize: 16,fontWeight: FontWeight.w700,),
                    TextButton(onPressed: (){}, child:  ReusableText(text: 'View All', fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF00579E),),)
                  ],
                ),


                Container(
                  height: dimensions.height10*3.5,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: dimensions.width10),
                            width: dimensions.width10*11,
                            height: dimensions.height10*2.5,
                            decoration: ShapeDecoration(
                              color: selectedIndex==index?Color(0xFFCCE8FF):Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: selectedIndex==index?1:0.50, color:selectedIndex==index? Color(0xFF00579E):Color(0xFFA5A5A5)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Center(
                              child: ReusableText(text: buttonName[index], fontSize: 12,fontWeight: FontWeight.w600,),

                            ),
                          ),
                        );
                      }
                  ),
                ),

                SizedBox(height: dimensions.height16,),

                Container(
                  height: 500,
                  child: ListView.builder(
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return Container(
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
                        );
                      }
                  ),
                ),
                // SizedBox(height: dimensions.height10,)
              ],
            ),
          ),
        ),
      );
    },);
  }
}
