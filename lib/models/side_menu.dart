// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Auth/log_in.dart';
import 'package:food_app/components/side_menu_items.dart';
import 'package:food_app/screens/side_menu_pages/side_menu_Offers.dart';
import 'package:food_app/screens/side_menu_pages/side_menu_Profile.dart';
import 'package:food_app/screens/side_menu_pages/side_menu_orders.dart';
import 'package:food_app/screens/side_menu_pages/side_menu_privacy.dart';
import 'package:food_app/screens/side_menu_pages/side_menu_security.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.09, top: screenHeight * 0.196),
      child: Container(
        color: const Color(0xffFA4A0C),
        width: screenWidth * 0.57,
        height: double.infinity,
        child: Column(
          children: [
            SideMenuItems(
              itemName: 'Profile',
              itemIcon: 'images/icons8-male-user-96.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SideMenuProfile()));
                print('1');
              },
            ),
            const ItemDivider(),
            SideMenuItems(
              itemName: 'orders',
              itemIcon: 'images/icons8_buy.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SideMenuOrders()));

                print('2');
              },
            ),
            const ItemDivider(),
            SideMenuItems(
              itemName: 'offers and promo',
              itemIcon: 'images/ic_outline-local-offer.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SideMenuOffers()));
                print('3');
              },
            ),
            const ItemDivider(),
            SideMenuItems(
              itemName: 'Privacy policy',
              itemIcon: 'images/icons8-note-96.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SideMenuPrivacy()));
                print('4');
              },
            ),
            const ItemDivider(),
            SideMenuItems(
              itemName: 'Security',
              itemIcon: 'images/whh_securityalt.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SideMenuSecurity()));
                print('5');
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            MaterialButton(
              onPressed: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Row(
                children: [
                  Text(
                    'Sign-out',
                    style: GoogleFonts.rubik(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Image.asset(
                    'images/icons8-down-50.png',
                    height: screenHeight * 0.027,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
