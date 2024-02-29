import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';

class imagePicker extends StatelessWidget {
  // final String hintText;
  final String infoText;
  final VoidCallback? onTap;


  const imagePicker({
    Key? key,
    // required this.hintText,
    required this.infoText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Container(
      width: dimensions.width342,
      height: dimensions.height40*3.5,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFD5D8E2)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: dimensions.height10*8.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: dimensions.width10*2.8,
                  height: dimensions.height10*2.8,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: dimensions.width10*2.8,
                          height: dimensions.height10*2.8,
                          child: Icon(Icons.upload_file),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Drag & Drop or ',
                              style: TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 14,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                                text: 'choose',
                                style: const TextStyle(
                                  color: Color(0xFF058FFF),
                                  fontSize: 14,
                                  fontFamily: 'nunito',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = onTap
                            ),
                            const TextSpan(
                              text: ' file to upload',
                              style: TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 14,
                                fontFamily: 'nunito',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        infoText,
                        style: const TextStyle(
                          color: Color(0xFF515978),
                          fontSize: 14,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}