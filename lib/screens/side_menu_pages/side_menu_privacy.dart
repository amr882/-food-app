// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:food_app/screens/nav_bar_pages/home_page.dart';

class SideMenuPrivacy extends StatefulWidget {
  const SideMenuPrivacy({super.key});

  @override
  State<SideMenuPrivacy> createState() => _SideMenueProfileState();
}

class _SideMenueProfileState extends State<SideMenuPrivacy> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}
