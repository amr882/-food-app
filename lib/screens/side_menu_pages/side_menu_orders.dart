// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/screens/nav_bar_pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SideMenuOrders extends StatefulWidget {
  const SideMenuOrders({super.key});

  @override
  State<SideMenuOrders> createState() => _SideMenuOrdersState();
}

class _SideMenuOrdersState extends State<SideMenuOrders> {
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
              right: screenWidth * 0.09),
          child: value.orders.isEmpty
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
                          width: 20.w,
                        ),
                        Text('Orders',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700, fontSize: 4.5.w))
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
                      'There are no items added to orders',
                      style: TextStyle(color: Colors.grey[700], fontSize: 2.h),
                    )
                  ],
                )
              : Column(
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                        top: 3.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'My Orders',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700, fontSize: 6.w),
                          ),
                        ],
                      ),
                    ),

                    // orders

                    Expanded(
                        child: ListView.builder(
                            itemCount: value.orders.length,
                            itemBuilder: (context, index) {
                              final FoodModel food = value.orders[index];
                              final String formattedDate =
                                  DateFormat('dd/MM/yyyy')
                                      .format(food.orderDate as DateTime);
                              final String foodName = food.name;
                              final String foodImage = food.image;
                              final double foodPrice = food.price;
                              final int foodQuantity = food.quantity;
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 1.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5.w,
                                          color: const Color.fromARGB(
                                              87, 212, 212, 212),
                                          offset: const Offset(5, 2))
                                    ],
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            179, 255, 255, 255),
                                        width: 0.2.h),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width: 80.w,
                                  height: 23.h,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.2.h),
                                    child: Column(
                                      children: [
                                        Text(
                                          foodName.length <= 17
                                              ? foodName
                                              : "${foodName.substring(0, 17)}...",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: GoogleFonts.rubik(
                                              color: const Color.fromARGB(
                                                  255, 65, 65, 65),
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Total: ${value.orderPrice()} \$',
                                        ),
                                        Text('${food.orderDate}'),
                                        Text('quantity: ${food.quantity}'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
        ),
      ),
    );
  }
}
