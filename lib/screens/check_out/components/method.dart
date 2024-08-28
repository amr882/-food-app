
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class Method extends StatefulWidget {
  final void Function()? onTap;
  final String? image;
  final Decoration? decoration;
  const Method({super.key, this.onTap, required this.image, this.decoration});

  @override
  State<Method> createState() => _MethodState();
}

class _MethodState extends State<Method> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 8.h,
        height: 8.h,
        decoration: widget.decoration,
        child: Center(
            child: SvgPicture.asset(
          "${widget.image}",
          height: 4.5.h,
        )),
      ),
    );
  }
}