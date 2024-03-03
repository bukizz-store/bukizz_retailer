import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/font_family.dart';


class ReusableTextField extends StatefulWidget {

  final String text;
  final IconData icon;
  final bool isPasswordType;
  final TextEditingController controller;
  final bool isPhoneNo;
  final bool isPinCode;
  final bool isEmail;

  ReusableTextField(this.text, this.icon, this.isPasswordType, this.controller,
      {this.isPhoneNo=false, this.isPinCode=false, this.isEmail=false});

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {

  bool isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;

    if (widget.isPinCode) {
      keyboardType = TextInputType.number;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(6)];
    } else if (widget.isPhoneNo) {
      keyboardType = TextInputType.phone;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)];
    } else {
      keyboardType = TextInputType.text;
      inputFormatters = null;
    }
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPasswordType && !isPasswordVisible,
      enableSuggestions: !widget.isPasswordType,
      autocorrect: !widget.isPasswordType,
      cursorColor: Color(0xFF121212),
      style: TextStyle(
          color: Color(0xFF121212),
          fontFamily: FontFamily.nunito.name
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: Color(0xFF058FFF),
        ),
        labelText: widget.text,
        labelStyle: TextStyle(
          color: Color(0xFFB8B8B8),
          fontFamily: FontFamily.nunito.name,
        ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Color(0xFFF9F9F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        suffixIcon: widget.isPasswordType
            ? IconButton(
          icon: Icon(
            isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Color(0xFFB8B8B8),
          ),
          onPressed: (){
            setState(() {
              isPasswordVisible=!isPasswordVisible;
            });
          },
        )
            : null,
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}

