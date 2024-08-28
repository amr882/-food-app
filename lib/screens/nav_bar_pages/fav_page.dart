import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:food_app/providers/fav_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final provider = FavoriteProvider.of(context);

    return Consumer<FavoriteProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.092,
              top: screenHeight * 0.0999,
              right: screenWidth * 0.09,
              bottom: 2.5.h),
          child: value.favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/heart.png',
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'No favorites yet!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 2.5.h,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'There are no items added to favorites',
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 2.h),
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/iwwa_swipe.svg',
                          height: 2.5.h,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'swipe on an item to delete',
                          style: TextStyle(fontSize: 1.5.h),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.favorites.length,
                        itemBuilder: (context, index) {
                          final FoodModel food = value.favorites[index];
                          final String foodImage = food.image;
                          final double foodPrice = food.price;
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ItemPage(itemDetails: food)));
                              },
                              child: Slidable(
                                movementDuration:
                                    const Duration(milliseconds: 400),
                                closeOnScroll: true,
                                actionPane: const SlidableBehindActionPane(),
                                secondaryActions: [
                                  Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: GestureDetector(
                                      onTap: () {
                                        provider.favorites.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 6.2.h,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffFA4A0C),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Center(
                                            child: SvgPicture.asset(
                                                'images/Vector (1).svg')),
                                      ),
                                    ),
                                  )
                                ],
                                actionExtentRatio: 0.25,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 12.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(foodImage),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 1.5.h,
                                          ),
                                          Text(
                                            '$foodPrice \$',
                                            style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffFA4A0C)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
