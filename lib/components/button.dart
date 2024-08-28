import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button extends StatefulWidget {
  final void Function()? onTap;
  final String title;
  const Button({super.key, required this.onTap, required this.title});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: 8.5.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.h,
                    offset: const Offset(0, 5),
                    color: const Color.fromARGB(255, 209, 207, 207)),
              ],
              color: const Color(0xffFA4A0C),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xffF6F6F9),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
