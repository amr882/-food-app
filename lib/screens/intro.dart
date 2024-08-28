// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_app/Auth/log_in.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print('screen height $screenHeight');
    print('screenWidth $screenWidth');
    return Scaffold(
      backgroundColor: const Color(0xffFF4B3A),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.082, left: screenWidth * 0.121),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(70)),
                        width: screenWidth * 0.1458,
                        height: screenHeight * 0.07,
                        child: Image.asset(
                          'images/pngwing.png',
                          width: screenWidth * 0.97,
                          height: screenHeight * 0.4685,
                        )),
                    SizedBox(
                      height: screenHeight * 0.024,
                    ),
                    Text('Food for Everyone',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.51, top: screenHeight * 0.14),
                      child: Image.asset(
                        'images/ToyFaces_Tansparent_BG_29.png',
                        fit: BoxFit.cover,
                        width: screenWidth * 0548,
                        height: screenHeight * 0.3497,
                      )),
                  Container(
                      padding: EdgeInsets.only(right: screenWidth * 0.2795),
                      child: Image.asset(
                        'images/ToyFaces_50 1.png',
                        width: screenWidth * 0.87,
                        height: screenHeight * 0.529,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.2559),
                    width: screenWidth * 1.74999,
                    child: Image.asset(
                      'images/Rectangle 68.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.067),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                minWidth: screenWidth * 0.76,
                height: screenHeight * 0.085,
                padding: const EdgeInsets.only(),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Text(
                  'Get start',
                  style: GoogleFonts.rubik(
                    color: const Color(0xffFF460A),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
