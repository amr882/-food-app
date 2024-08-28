
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.transparent,
          width: 100.w,
          height: 100.h,
        ),
        Center(
          child: Container(
            color: Colors.transparent,
            width: 100,
            height: 100,
            child: const Center(
              child: RiveAnimation.asset(
                'images/loading.riv',
                fit: BoxFit.cover,
                artboard: 'loading',
              ),
            ),
          ),
        )
      ],
    );
  }
}
