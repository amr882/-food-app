import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomDialog extends StatelessWidget {
  final String titel;
  final String addedQuantity;
  final void Function()? onTap;
  const CustomDialog({
    super.key,
    required this.titel,
    required this.addedQuantity,
   required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xffFFFFFF),
        ),
        width: 70.w,
        height: 34.h,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              width: 70.w,
              height: 8.h,
              child: Center(
                  child: Text(
                'Please note',
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w600, fontSize: 2.h),
              )),
            ),
            SizedBox(
              height: 2.h,
            ),

            //Item Name
            const Text(
              'Item Name',
              style: TextStyle(color: Color(0xff808080)),
            ),
            Text(
              titel,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: const Divider(
                color: Color(0xffe5e5e5),
              ),
            ),

            // quantity

            const Text(
              'Added Quantity',
              style: TextStyle(color: Color(0xff808080)),
            ),
            Text(
              addedQuantity,
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffFA4A0C),
                ),
                width: 30.w,
                height: 6.2.h,
                child: const Center(
                    child: Text(
                  'Ok !',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
