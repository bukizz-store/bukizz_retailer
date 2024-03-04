import 'dart:typed_data';

import 'package:bukizz_retailer/utils/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../mvvm/viewModel/orders/orders.dart';

class PDFViewer extends StatefulWidget {
  // final Uint8List function;
  const PDFViewer({super.key});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    var order = context.read<Order>().getSelectedOrder;
    Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
      final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
      final font = await PdfGoogleFonts.nunitoMedium();
      final boldFont = await PdfGoogleFonts.nunitoBold();
      final extraBoldFont = await PdfGoogleFonts.nunitoExtraBold();


      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'BUKIZZ',
                           style: pw.TextStyle(
                             fontWeight: pw.FontWeight.bold,
                             font: extraBoldFont,
                             fontSize: 40,
                           )
                        ),
                        pw.Text(
                            'SHIP TO\n ${order.address.name}  \n${order.address.houseNo}, ${order.address.street}, \n${order.address.pinCode} ${order.address.city} ${order.address.state} \n${order.address.phone} \n${order.address.email} \n',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: boldFont,
                              fontSize: 15,
                            )
                        )
                      ]
                    ),
                    pw.Column(

                      children: [
                        pw.Text(
                            'ORDER # ${order.orderId.split('-')[0]}',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: extraBoldFont,
                              fontSize: 20,
                            )
                        ),
                        pw.SizedBox(height: 15),
                        pw.Container(
                          alignment: pw.Alignment.center,
                          child: pw.BarcodeWidget(
                            barcode: pw.Barcode.qrCode(),
                            data: order.orderId,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ]
                    )
                  ]
                ),
                pw.SizedBox(height: 15),
                pw.Container(
                  height: 2,
                  width: 1000,
                  color: PdfColors.black
                ),
                pw.SizedBox(height: 15),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'ITEMS',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            font: boldFont,
                            fontSize: 15,
                          )
                        ),
                        // pw.SizedBox(height: 20),
                        pw.Text(
                            'QUANTITY',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: boldFont,
                              fontSize: 15,
                            )
                        ),
                        // pw.SizedBox(height: 20),
                        pw.Text(
                            'PRICE',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: boldFont,
                              fontSize: 15,
                            )
                        ),

                      ]
                    ),
                    pw.SizedBox(height: 30),
                    pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.SizedBox(
                          width: 100,
                          child: pw.Text(
                              'CLASS 9TH BOOK SET/ARTS',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                font: font,
                                fontSize: 15,
                              )
                          ),
                        ),
                        // pw.SizedBox(height: 20),
                        pw.SizedBox(
                          width: 100,
                          child: pw.Text(
                              '3',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                font: font,
                                fontSize: 15,
                              ),
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                        // pw.SizedBox(height: 20),
                        pw.Text(
                            'Rs. ${order.saleAmount}',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: font,
                              fontSize: 15,
                            )
                        ),

                      ]
                    ),
                    pw.SizedBox(height: 30),
                    pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.SizedBox(
                          width: 100,
                          child: pw.Text(
                              'Packaging & Handling Charges',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                font: font,
                                fontSize: 15,
                              )
                          ),
                        ),
                        // pw.SizedBox(height: 20),
                        pw.SizedBox(
                          width: 100,
                          child: pw.Text(
                            '',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: font,
                              fontSize: 15,
                            ),
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                        pw.SizedBox(height: 20),
                        pw.Text(
                            'Rs. ${order.deliveryCharge}',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              font: font,
                              fontSize: 15,
                            )
                        )
                      ]
                    ),

                  ]
                ),

                pw.SizedBox(height: 15),
                pw.Container(
                    height: 2,
                    width: 1000,
                    color: PdfColors.black
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                        'TOTAL',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          font: extraBoldFont,
                          fontSize: 15,
                        )
                    ),
                    pw.Text(
                        'Rs. ${order.saleAmount + order.deliveryCharge}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          font: extraBoldFont,
                          fontSize: 15,
                        )
                    )
                  ]
                ),
                pw.SizedBox(height: 15),

                pw.Center(
                  child: pw.Text(
                      'THANK YOU FOR SHOPPING WITH BUKIZZ....',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        font: extraBoldFont,
                        fontSize: 15,
                      ),
                      textAlign: pw.TextAlign.center
                  )
                )
              ],
            );
          },
        ),
      );
      return pdf.save();
    }
    return PdfPreview(
      build: (format) => _generatePdf(format, "PDFVIEWER"),
    );
  }


}
