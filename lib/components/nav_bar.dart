import 'package:flutter/material.dart';
import 'package:food_app/screens/nav_bar_pages/fav_page.dart';
import 'package:food_app/screens/nav_bar_pages/history_page.dart';
import 'package:food_app/screens/nav_bar_pages/home_page.dart';
import 'package:food_app/screens/nav_bar_pages/profile_page.dart';
import 'package:sizer/sizer.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPagePageState();
}

class _HelloPagePageState extends State<HelloPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const Fav(),
    const Profile(),
    const Historyp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      backgroundColor: const Color(0xffF2F2F2),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(2.h),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: IconThemeData(
            size: 3.h,
          ),
          selectedIconTheme: IconThemeData(size: 4.h, shadows: const [
            Shadow(
              color: Color.fromARGB(221, 250, 75, 12),
              blurRadius: 40.0,
              offset: Offset(2.5, 3),
            ),
          ]),
          selectedItemColor: const Color.fromARGB(255, 255, 0, 0),
          unselectedItemColor: const Color(0xffADADAF),
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: ''),
            BottomNavigationBarItem(icon:Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_sharp), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: '')
          ],
        ),
      ),
    );
  }
}
