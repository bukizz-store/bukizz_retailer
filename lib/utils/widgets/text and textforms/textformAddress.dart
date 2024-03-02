import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

class CustomTextForm extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final String labelText;
  final bool isPasswordType;
  final IconData ?trailingIcon;

  CustomTextForm({
    required this.width,
    required this.height,
    required this.controller,
    required this.hintText,
    this.icon, required this.labelText, required this.isPasswordType,
    this.trailingIcon,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool isPasswordVisible = false; // Declare isPasswordVisible here

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPasswordType && !isPasswordVisible,
        enableSuggestions: !widget.isPasswordType,
        autocorrect: !widget.isPasswordType,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null
              ? Padding(
            padding: EdgeInsets.only(left: dimensions.height8 * 2),
            child: Icon(
              widget.icon,
              color: Color(0xFF058FFF),
            ),
          )
              : null,
          suffixIcon: widget.isPasswordType
              ? IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Color(0xFFB8B8B8),
            ),
            onPressed: () {
              // Toggle password visibility
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          )
              : null,
          contentPadding: EdgeInsets.symmetric(
              horizontal: dimensions.height8 * 2, vertical: 0),
          hintText: widget.hintText,
          labelText: widget.labelText,
          hintStyle: TextStyle(
            color: Colors.black38, // Change the color to match the focused border color
            fontSize: 14,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          labelStyle:TextStyle(
            color: Colors.grey
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.height / 2),
            borderSide: BorderSide(color: Color(0xFF7A7A7A)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.height / 2),
            borderSide: BorderSide(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}

