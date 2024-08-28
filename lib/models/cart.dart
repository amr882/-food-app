// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/loading.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/screens/check_out/checkout_info.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:food_app/screens/nav_bar_pages/home_page.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  removeFromCart(FoodModel food, BuildContext context) {
    final shop = context.read<CartProvider>();
    shop.removeFromCart(food);
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: const Color(0xffF5F5F8),
          body: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.092,
                top: screenHeight * 0.0999,
                right: screenWidth * 0.09,
                bottom: 2.5.h),
            child: value.cart.isEmpty
                ? Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop(const HomePage());
                            },
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text('Cart',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 4.5.w))
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Image.asset(
                        'images/bag.png',
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'No items yet!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 2.5.h,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'There are no items added to cart',
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 2.h),
                      )
                    ],
                  )
                : Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop(const HomePage());
                                },
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              Text('Cart',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 4.5.w))
                            ],
                          ),
                          const SizedBox(
                            height: 50,
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
                              itemCount: value.cart.length,
                              itemBuilder: (context, index) {
                                final FoodModel food = value.cart[index];
                                final String foodName = food.name;
                                final String foodImage = food.image;
                                final double foodPrice = food.price;
                                final int foodQuantity = food.quantity;

                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ItemPage(itemDetails: food)));
                                    },
                                    child: Slidable(
                                      
                                      movementDuration:
                                          const Duration(milliseconds: 400),
                                      closeOnScroll: true,
                                      actionPane:
                                          const SlidableBehindActionPane(),
                                      secondaryActions: [
                                        Padding(
                                          padding: EdgeInsets.all(2.h),
                                          child: GestureDetector(
                                            onTap: () =>
                                                removeFromCart(food, context),
                                            child: Container(
                                              height: 6.2.h,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffFA4A0C),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
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
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 12.h,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Hero(
                                                  tag: '${food.id}',
                                                  child:
                                                      Image.asset(foodImage)),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    foodName.length <= 17
                                                        ? foodName
                                                        : "${foodName.substring(0, 17)}...",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.nunito(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 0, 0, 0)),
                                                  ),
                                                  SizedBox(
                                                    height: 1.5.h,
                                                  ),
                                                  Text(
                                                    '$foodPrice \$',
                                                    style: GoogleFonts.nunito(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xffFA4A0C)),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                'X  $foodQuantity',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xffFA4A0C),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 2.h),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Column(
                              children: [
                                // delivery
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery:',
                                      style: TextStyle(
                                        fontSize: 2.h,
                                      ),
                                    ),
                                    Text(
                                      '5 \$',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 2.4.h,
                                        color: const Color(0xffFA4A0C),
                                      ),
                                    )
                                  ],
                                ),
                                // total price
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'total Price:',
                                      style: TextStyle(fontSize: 2.h),
                                    ),
                                    Text(
                                      '${value.calculate()} \$',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 2.4.h,
                                        color: const Color(0xffFA4A0C),
                                      ),
                                    )
                                  ],
                                ),
                                Button(
                                    onTap: () async {
                                      // Complete order

                                      if (value.cart.isNotEmpty) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const Loading();
                                          },
                                        );
                                        await Future.delayed(
                                            const Duration(seconds: 4));

                                        print(
                                            '++++++++++++++++++++++++++++++++++++++++++');
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const CheckoutInfo()));
                                      }
                                    },
                                    title: 'Complete order')
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
          )),
    );
  }
}
