
import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

class ReusableElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String buttonText;
  final Color ?buttonColor;
  final Color textColor;
  final  Color shadowColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final double letterSpacing;
  final IconData? iconData;
  final String? imagePath;
  final Color borderColor;
  // Optional asset image path

  const ReusableElevatedButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor = const Color(0xFF058FFF),
    this.textColor = Colors.white,
    this.shadowColor=const Color(0xFF0466b5),
    this.fontSize = 16,
    this.fontFamily = 'Open Sans',
    this.fontWeight = FontWeight.w700,
    this.letterSpacing = 0.30,
    this.iconData,
    this.imagePath,
    this.borderColor=Colors.white,
    // Include the optional asset image path in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
       color: buttonColor,
       borderRadius: BorderRadius.circular(40),
       boxShadow: [
         BoxShadow(
           color: shadowColor,
           offset:Offset(0,4),

         )
       ]
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: 1, color:buttonColor!),
            borderRadius: BorderRadius.circular(40),
          ),
          //elevation: 11,
          // shadowColor: Colors.grey,
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  imagePath!,
                  height: dimensions.height24, // Adjust the height as needed
                  width: dimensions.width24, // Adjust the width as needed
                  // color: textColor,
                ),
              ),
            if (iconData != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  iconData,
                  color: textColor,
                ),
              ),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
