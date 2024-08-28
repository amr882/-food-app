// ignore_for_file: avoid_print, use_build_context_synchronously, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/Auth/log_in.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/my_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Google Auth

    Future signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('entry_page', (route) => false);
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                //logo

                Container(
                  padding: EdgeInsets.all(screenWidth * 0.21876),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 30,
                            offset: Offset(0, 0.5),
                            color: Color.fromARGB(255, 224, 224, 224))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  width: screenWidth * 1.006,
                  height: screenHeight * 0.3,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'images/pngwing.png',
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.41, top: screenHeight * 0.232),
                  child: Text(
                    'Sign-up',
                    style: GoogleFonts.rubik(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffFA4A0C),
                      borderRadius: BorderRadius.circular(40)),
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.28, left: screenWidth * 0.33),
                  height: screenHeight * 0.00487,
                  width: screenWidth * 0.326,
                ),
              ]),

              //User name

              MyTextField(
                labelText: 'User name',
                obscureText: false,
                controller: username,
              ),

              SizedBox(
                height: screenHeight * 0.024,
              ),

              //email address

              MyTextField(
                labelText: 'Email address',
                obscureText: false,
                controller: email,
              ),
              SizedBox(
                height: screenHeight * 0.024,
              ),

              //password

              MyTextField(
                labelText: 'Password',
                obscureText: true,
                controller: password,
              ),
              SizedBox(
                height: screenHeight * 0.0487,
              ),

              //log in button

              Button(
                  onTap: () async {
                    try {
                      Navigator.of(context).pushReplacementNamed('hellopage');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  title: 'Sign-up'),

              //auth
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                  Text(
                    'or continue with',
                    style: GoogleFonts.rubik(color: const Color(0xffAAA6A6)),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.024,
              ),
              GestureDetector(
                onTap: () {
                  signInWithGoogle();
                },
                child: Container(
                  width: 80.w,
                  height: 5.5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(207, 236, 236, 236))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/icons8-google.svg',
                          height: 5.h,
                        ),
                        Text('Continue with Google',
                            style: GoogleFonts.nunito(
                                color: const Color.fromARGB(185, 0, 0, 0),
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              Container(
                width: 80.w,
                height: 5.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(207, 236, 236, 236))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/icons8-facebook.svg',
                        height: 5.h,
                      ),
                      Text('Continue with Facebook',
                          style: GoogleFonts.nunito(
                              color: const Color.fromARGB(185, 0, 0, 0),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.024,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: GoogleFonts.rubik(color: const Color(0xff888686)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Login()));
                    },
                    child: const Text('Login'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



    // child: Image.asset('images/google.png'),

        // child: Image.asset('images/Facebook.png'),