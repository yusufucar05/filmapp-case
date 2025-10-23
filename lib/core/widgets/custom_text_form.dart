import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  Widget? prefixIcon;
  Widget? hint;
  int? maxLength;
  TextEditingController? controller;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  bool obscureText = false;
  CustomTextFormField({
    this.maxLength,
    super.key,
    required this.prefixIcon,
    required this.controller,
    this.hint,
    this.validator,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        obscuringCharacter: "*",
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        maxLength: maxLength,
        controller: controller,
        validator: (value) => validator!(value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          focusColor: Colors.black38,
          hint: hint,
          prefixIconColor: Colors.white,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
