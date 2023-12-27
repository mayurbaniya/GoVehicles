
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TextFieldsForLoginSignUpPages extends StatelessWidget {


   TextFieldsForLoginSignUpPages({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.fieldPadding,
    this.suffixIconColor,
    this.obscureText,
    this.validator,
    this.hasSuffixIcon,
    this.keyboardType,
    this.inputLength,
    this.onlyDigits,
    this.controller,
  });

  final int? inputLength;
  final bool? hasSuffixIcon;
  final IconData prefixIcon;
  final String hintText;
  final IconData? suffixIcon;
  final double? fieldPadding;
  final Color? suffixIconColor;
  bool? obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool? onlyDigits;
  final TextEditingController? controller;
  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0, vertical: fieldPadding ?? 10.0 ), // <--- here this vertical padding
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.brown,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType ?? TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Color(0xFF788154),
          ),
          suffixIcon: hasSuffixIcon ?? false ? IconButton(
             icon: Icon(
              suffixIcon,
              color: suffixIconColor ?? Colors.black,
            ),
            onPressed: (){
              obscureText == !obscureText!;
            },
          ) : null,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide.none),
          errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: Colors.transparent)
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        validator: validator,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(inputLength ?? 100),
        ]
      ),
    );
  }
}
