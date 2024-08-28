// ignore_for_file: file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/nav_bar_pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SideMenuProfile extends StatefulWidget {
  const SideMenuProfile({super.key});

  @override
  State<SideMenuProfile> createState() => _SideMenuProfileState();
}

class _SideMenuProfileState extends State<SideMenuProfile> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String phoneNumber = 'Get Phone Number';

  Future getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

  //get profile photo
  getProfileImage() {
    if (firebaseAuth.currentUser?.photoURL != null) {
      return Image.network(
        FirebaseAuth.instance.currentUser?.photoURL as String,
        height: 12.h,
        width: 25.w,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'images/20c00f0f135c950096a54b7b465e45cc.jpg',
        width: 25.w,
        height: 12.h,
        fit: BoxFit.cover,
      );
    }
  }

//get User name


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F8),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.092,
            top: screenHeight * 0.0999,
            right: screenWidth * 0.09),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(const HomePage());
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 3.h, bottom: 5.h),
              child: Row(
                children: [
                  Text(
                    'My profile',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700, fontSize: 6.w),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, bottom: 2.h),
              child: Row(
                children: [
                  Text(
                    'Personal details',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700, fontSize: 4.5.w),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              width: 75.w,
              height: 17.h,
              child: Row(
                children: [
                  // Photo
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2.0.h),
                        child: ClipRRect(
                          child: getProfileImage(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),

                  //info
                  SizedBox(
                    width: 38.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${FirebaseAuth.instance.currentUser!.displayName}',
                          style: GoogleFonts.rubik(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 2.h),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          '${FirebaseAuth.instance.currentUser!.email}',
                          style: GoogleFonts.rubik(
                              color: const Color.fromARGB(255, 163, 163, 163),
                              fontWeight: FontWeight.w600,
                              fontSize: 1.2.h),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
