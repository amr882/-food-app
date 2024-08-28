// ignore_for_file: use_build_context_synchronously, avoid_print, void_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/models/item_card.dart';
import 'package:food_app/models/search_bar.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/screens/entry_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.121,
                    right: screenWidth * 0.121,
                    top: screenHeight * 0.104),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            onTap(setState);
                          },
                          child: Image.asset(
                              fit: BoxFit.cover,
                              height: 4.h,
                              isSideMenuClased
                                  ? 'images/menu.png'
                                  : 'images/close.png'),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(() => const Cart(),
                                  transition: Transition.rightToLeft);
                            },
                            icon: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    'images/bag.svg',
                                    height: 3.h,
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: value.cart.isNotEmpty
                                            ? Colors.black
                                            : Colors.transparent),
                                    width: 2.2.h,
                                    height: 2.2.h,
                                    child: Center(
                                        child: Text(
                                      '${value.cart.length}',
                                      style: GoogleFonts.nunito(
                                          fontSize: 1.5.h,
                                          color: value.cart.isNotEmpty
                                              ? Colors.white
                                              : Colors.transparent),
                                    )))
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Row(
                      children: [
                        Text('Delicious ',
                            style: GoogleFonts.nunito(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 4.h,
                                fontWeight: FontWeight.w900)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('food for you',
                            style: GoogleFonts.nunito(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 4.h,
                                fontWeight: FontWeight.w900)),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SearchPage(),
                            transition: Transition.downToUp);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffEFEEEE),
                            borderRadius: BorderRadius.circular(30)),
                        width: screenWidth * 0.76,
                        height: screenHeight * 0.07,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            SvgPicture.asset('images/search.svg'),
                            SizedBox(width: screenWidth * 0.039),
                            Text(
                              'Search',
                              style: GoogleFonts.rubik(
                                color: const Color(0xff000000),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.0122,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h, child: const ItemCard()),
            ],
          ),
        ),
      ),
    );
  }
}
