import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({
    super.key,
    this.controller,
    this.hintText,
    this.isObscure = false,
    this.validator
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool isObscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,

      style: const TextStyle(
        color: Color.fromARGB(255, 70, 70, 70),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      decoration: InputDecoration(
        labelText: hintText,

        labelStyle: TextStyle(
          color: Color.fromARGB(255, 70, 70, 70),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        floatingLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 54, 52, 180),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

        filled: true,
        fillColor: Colors.white,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Color.fromARGB(255, 107, 107, 107),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255,54,52,180),
          )
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: const Color.fromARGB(255, 255, 140, 132),
          )
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            width: 2,
            color: const Color.fromARGB(255, 255, 17, 0),
          )
        )
      ),
      validator: validator
    );
  }
}
