import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ExpiryDate extends StatelessWidget {
  final Key formState;
  final TextEditingController controller;
  final List<TextInputFormatter> textInputFormatter;

  final void Function(String)? onChanged;

  final String? Function(String?)? validator;

  const ExpiryDate({
    Key? key,
    required this.formState,
    required this.controller,
    this.onChanged,
    required this.textInputFormatter,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.5.h),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Expired Date',
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
              obscureText: false,
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: textInputFormatter,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(
                    color: Color(0xffbfbfbf), fontWeight: FontWeight.w400),
                border: OutlineInputBorder(),
                // focused
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 0, 0, 0))),

                // unfocused
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                hintText: 'MM/YY',
              ),
              onChanged: onChanged,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}

class CardDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
