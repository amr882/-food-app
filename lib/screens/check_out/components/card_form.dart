import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CardForm extends StatelessWidget {
  final TextEditingController controller;
  final double padding;
  final String hintText;
  final bool obscureText;
  final String cardInfo;
  final int? maxLength;
  final Key formState;
  final TextInputType textInputType;
  final List<TextInputFormatter> textInputFormatter;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CardForm({
    Key? key,
    required this.controller,
    required this.padding,
    required this.hintText,
    required this.obscureText,
    required this.cardInfo,
    required this.maxLength,
    required this.formState,
    required this.onChanged,
    required this.textInputType,
    required this.validator,
    required this.textInputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.5.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  cardInfo,
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500, color: Colors.grey[500]),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Form(
              key: formState,
              child: TextFormField(
                cursorColor: Colors.grey[700],
                obscureText: obscureText,
                controller: controller,
                keyboardType: textInputType,
                inputFormatters: textInputFormatter,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                      color: Color(0xffbfbfbf), fontWeight: FontWeight.w400),
                  border: const OutlineInputBorder(),

                  // focused
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),

                  // unfocused
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255))),
                  hintText: hintText,
                ),
                onChanged: onChanged,
                validator: validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}