import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../constants/dimensions.dart';

class ContactUsScreen extends StatelessWidget {
  static const route = '/contact_us';

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Column(
        children: [
          SizedBox(height: dimensions.height16,),
          Container(
            width: dimensions.screenWidth,
            height: dimensions.height10*15.6,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: dimensions.height10,),
                SizedBox(
                  width: dimensions.width342,
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mailing Address: ',
                          style: TextStyle(
                            color: Color(0xFF121212),
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text:
                          '2nd floor 1884 sector 8, Sector 8, Kurukshetra, Haryana',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: dimensions.height8 * 3),
                SizedBox(
                  width: dimensions.width342,
                  child: GestureDetector(
                    onTap: () async {
                      Uri phoneNo = Uri.parse('tel:+919369467134');
                      await launchUrl(phoneNo);
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Telephone: ',
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '+919369467134',
                            style: TextStyle(
                              color: Color(0xFF00579E),
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: dimensions.height8 * 3),
                SizedBox(
                  width: dimensions.width342,
                  child:   GestureDetector(
                    onTap: () async {
                      Uri email = Uri.parse('mailto:<bukizzstore@gmail.com>');
                      await launchUrl(email);

                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Email: ',
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'bukizzstore@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF00579E),
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}
