import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.092, top: 10.h, right: screenWidth * 0.09),
        child: Column(
          children: [
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
