// ignore_for_file: avoid_print,

import 'package:flutter/material.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: FoodModel.items.length,
        itemBuilder: ((BuildContext context, int i) {
          return GestureDetector(
            // to open item info

            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ItemPage(itemDetails: FoodModel.items[i])));
              print('tapped on :  ${FoodModel.items[i].id}');
            },
            child: Row(
              children: [
                SizedBox(
                  width: 4.w,
                ),
                SizedBox(
                  width: 200,
                  height: 35.h,
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.06),
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth * 0.47,
                        height: screenHeight * 0.329,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 20,
                                  offset: Offset(0, -5),
                                  color: Color.fromARGB(255, 209, 207, 207))
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffFFFFFF)),
                        child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.024),
                          child: Text(
                            FoodModel.items[i].name.length <= 17
                                ? FoodModel.items[i].name
                                : "${FoodModel.items[i].name.substring(0, 17)}...",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.rubik(
                                color: const Color.fromARGB(255, 65, 65, 65),
                                fontSize: 3.5.w,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
                        tag: '${FoodModel.items[i].id}',
                        child: Container(
                          width: 18.h,
                          height: 18.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: screenWidth * 0.07293,
                                    offset: const Offset(0, 5),
                                    color: const Color.fromARGB(
                                        255, 209, 207, 207)),
                              ]),
                          child: ClipRRect(
                            child: Image.asset(
                              FoodModel.items[i].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: screenHeight * 0.0365,
                      ),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Price:  ${FoodModel.items[i].price} \$ ',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFA4A0C)),
                          )),
                    )
                  ]),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
