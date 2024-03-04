import 'dart:typed_data';
import 'package:bukizz_retailer/constants/dimensions.dart';
import 'package:bukizz_retailer/mvvm/viewModel/orders/orders.dart';
import 'package:bukizz_retailer/utils/widgets/PDF/pdf_viewer.dart';
import 'package:bukizz_retailer/utils/widgets/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utils/widgets/text and textforms/Reusable_text.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BillScreen extends StatefulWidget {
  static const route = '/bill';
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {

  final String orderNumber = '#12345';
  final String customerName = 'Stuti Awasthi';
  final String address = '137, Shikshak Nagar, Kalyanpur kala(Near Vishwas Hospital, Purana Shivli Road), Kanpur Nagar. 208017 Kanpur Nagar UP';
  final double totalPrice = 1720.0;
  final double discount = 175.0;
  final double deliveryCharges = 40.0;

  // Future<Uint8List> generateInvoice() async {
  //
  //   final String orderNumber = '#12345';
  //   final String customerName = 'Stuti Awasthi';
  //   final String address = '137, Shikshak Nagar, Kalyanpur kala(Near Vishwas Hospital, Purana Shivli Road), Kanpur Nagar. 208017 Kanpur Nagar UP';
  //   final double totalPrice = 1720.0;
  //   final double discount = 175.0;
  //   final double deliveryCharges = 40.0;
  //   final pdf = pw.Document();
  //   // pdf.addPage(
  //       pdf.addPage(
  //           pw.Page(
  //               margin: const pw.EdgeInsets.all(10),
  //               pageFormat: PdfPageFormat.a4,
  //               build: (context) {
  //                 return pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Row(
  //                           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             pw.Header(text: "About Cat", level: 1),
  //                             // pw.Image(pw.MemoryImage(byteList), fit: pw.BoxFit.fitHeight, height: 100, width: 100)
  //                           ]
  //                       ),
  //                       pw.Divider(borderStyle: pw.BorderStyle.dashed),
  //                       // pw.Paragraph(text: text),
  //                     ]
  //                 );
  //               }
  //           ));
  //   );
  //
  //   return pdf.save();
  // }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Consumer<Order>(builder: (context , orderData , child){
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
                        ReusableText(text: '#${orderData.getSelectedOrder.orderId.split('-')[0]}', fontSize: 16,fontWeight: FontWeight.w700,),
                        Column(
                          children: [
                            ReusableText(text: 'Amount', fontSize: 12,color: AppColors.lightTextColor,),
                            20.verticalSpace,
                            ReusableText(text: '₹ ${orderData.getSelectedOrder.saleAmount}', fontSize: 16)
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
                        ReusableText(text: orderData.getSelectedOrder.status, fontSize: 12,color: Color(0xFF058FFF),)
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
                          onTap: ()async{
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PDFViewer()));
                          },
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
                      child: Text.rich(
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
                              text: '${orderData.getSelectedOrder.address.name}  \n${orderData.getSelectedOrder.address.houseNo}, ${orderData.getSelectedOrder.address.street}, \n${orderData.getSelectedOrder.address.pinCode} ${orderData.getSelectedOrder.address.city} ${orderData.getSelectedOrder.address.state} \n${orderData.getSelectedOrder.address.phone} \n${orderData.getSelectedOrder.address.email} \n',
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
                            ReusableText(text: '₹ ${orderData.getSelectedOrder.saleAmount}', fontSize: 12,fontWeight: FontWeight.w500,)
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(text: 'Discount', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
                            ReusableText(text: '- ₹${orderData.getSelectedOrder.totalAmount - orderData.getSelectedOrder.saleAmount}', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.green),
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(text: 'Delivery Charges', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
                            ReusableText(text: '₹ ${orderData.getSelectedOrder.deliveryCharge}', fontSize: 12,fontWeight: FontWeight.w500,)
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(text: 'Total Amount', fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.lightTextColor,),
                            ReusableText(text: '₹ ${orderData.getSelectedOrder.saleAmount + orderData.getSelectedOrder.deliveryCharge}', fontSize: 12,fontWeight: FontWeight.w500,)
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
    });
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
