// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String labelText;
  final bool obscureText;

  const MyTextField({
    super.key,
    this.controller,
    required this.labelText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.097),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}
