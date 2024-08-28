import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/screens/check_out/add_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.w,
      height: 28.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(3.4.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'CREDIT',
                  style: GoogleFonts.rubik(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/chip.png',
                  height: 4.h,
                ),
                Image.asset(
                  'images/contactless.png',
                  height: 3.h,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              cardNumber,
              style: GoogleFonts.rubik(
                  color: Colors.white, fontSize: 4.5.w, wordSpacing: 1.5.h),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'valid ',
                  style: GoogleFonts.nunito(
                      color: const Color.fromARGB(255, 207, 207, 207),
                      fontSize: 3.w),
                ),
                Text(
                  expiredDate,
                  style: GoogleFonts.nunito(color: Colors.white, fontSize: 3.w),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 3.w,
                  ),
                ),
                SvgPicture.asset(selected == mastarCard ? mastarCard : visa , height: 3.5.h,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
