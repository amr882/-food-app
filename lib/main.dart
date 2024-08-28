// ignore_for_file: avoid_print
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Auth/log_in.dart';
import 'package:food_app/components/nav_bar.dart';
import 'package:food_app/screens/entry_page.dart';
import 'package:food_app/providers/fav_provider.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/screens/intro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBGEgMsjvmdYO-hzmC9gep-LpUPsfb3Dg8",
              appId: "1:664083922320:android:727763813014ce9d6d8715",
              messagingSenderId: "664083922320",
              projectId: "food-app-d3f2f"))
      : await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser == null
            ? const Intro()
            : const EntryPage(),
        routes: {
          'hellopage': (context) => const HelloPage(),
          'login': (context) => const Login(),
          'entry_page': (context) => const EntryPage()
        },
      );
    });
  }
}
