import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 44, 51, 151),
        padding: EdgeInsets.symmetric(horizontal: 52, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 3,
        shadowColor: Color.fromARGB(255, 162, 149, 192),
      ),
      onPressed: onPressed,
      child: Text(
        text, 
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 252, 250, 255),
          letterSpacing: 1,
          )
        ),
    );
  }
}
