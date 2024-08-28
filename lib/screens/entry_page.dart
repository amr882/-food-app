// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:food_app/components/nav_bar.dart';
import 'package:food_app/models/side_menu.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late Animation _scaleanimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    _scaleanimation = Tween<double>(begin: 1, end: 0.67).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn));
    print(_animation.value);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double homePageSize = (screenWidth * 0.44);
    return Scaffold(
      backgroundColor: const Color(0xffFA4A0C),
      body: Stack(
        children: [
          AnimatedPositioned(
              right:
                  isSideMenuClased ? screenWidth * 0.9236 : screenWidth * 0.486,
              duration: const Duration(milliseconds: 200),
              width: screenWidth * 0.55,
              height: MediaQuery.of(context).size.height,
              child: const SideMenu()),
          Transform.translate(
              offset: Offset(screenWidth * 0.36, screenHeight * 0.055),
              child: Transform.scale(
                  scale: 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(169, 253, 108, 56),
                        borderRadius: BorderRadius.circular(30)),
                  ))),
          Transform.translate(
              offset: Offset(_animation.value * homePageSize, 0),
              child: Transform.scale(
                  scale: _scaleanimation.value,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isSideMenuClased ? 0 : 30),
                      child: const HelloPage()))),
        ],
      ),
    );
  }
}

bool isSideMenuClased = true;
late AnimationController _animationController;
void onTap(Function setState) {
  if (isSideMenuClased) {
    _animationController.forward();
  } else {
    _animationController.reverse();
  }
  setState(() {
    isSideMenuClased = !isSideMenuClased;
  });
}
