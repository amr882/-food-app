// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_app/components/alert_dialog.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/providers/fav_provider.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:food_app/screens/nav_bar_pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ItemPage extends StatefulWidget {
  final FoodModel itemDetails;

  const ItemPage({
    super.key,
    required this.itemDetails,
  });

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int quantity = 0;

  quantityIncrease() {
    setState(() {
      quantity++;
    });
  }

  quantityDecrease() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  // add to cart
  addToCart() {
    if (quantity > 0) {
      final shop = context.read<CartProvider>();
      shop.addToCart(widget.itemDetails, quantity);
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
          titel: widget.itemDetails.name,
          addedQuantity: '$quantity',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final provider = context.read<FavoriteProvider>();

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F9),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.09965,
            top: screenHeight * 0.073,
            right: screenWidth * 0.09965),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(const HomePage());
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  IconButton(
                      icon: provider.isExist(widget.itemDetails)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                      color: provider.isExist(widget.itemDetails)
                          ? const Color(0xffFA4A0C)
                          : Colors.black,
                      onPressed: () {
                        setState(() {
                          provider.toggleFavorite(widget.itemDetails);
                        });
                      }),
                ],
              ),
              Hero(
                tag: '${widget.itemDetails.id}',
                child: Stack(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.29395,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: screenWidth * 0.07293,
                                offset: const Offset(0, 5),
                                color:
                                    const Color.fromARGB(52, 250, 75, 12)),
                          ]),
                      child: Image.asset(
                        widget.itemDetails.image,
                        height: 22.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.073,
              ),
              Text(
                widget.itemDetails.name,
                style: GoogleFonts.nunito(
                  fontSize: screenHeight * 0.02437,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '${widget.itemDetails.price} \$',
                style: GoogleFonts.nunito(
                    fontSize: screenHeight * 0.02437,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffFA4A0C)),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Text(
                    'Return policy',
                    style: GoogleFonts.rubik(
                        fontSize: 4.w, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                style: GoogleFonts.rubik(
                    fontSize: 3.w,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 104, 103, 103)),
              ),
              SizedBox(
                height: 2.h,
              ),

              // quantity

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffFA4A0C),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: quantityDecrease,
                          child: const Quantity(
                            icon: Icons.remove,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('$quantity',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 2.5.h,
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        GestureDetector(
                          onTap: quantityIncrease,
                          child: const Quantity(
                            icon: Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Button(onTap: addToCart, title: 'Add to cart')
            ],
          ),
        ),
      ),
    );
  }
}

class Quantity extends StatelessWidget {
  final IconData icon;
  const Quantity({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      decoration: BoxDecoration(
          color: const Color(0xffFA4A0C),
          borderRadius: BorderRadius.circular(500)),
      child: Padding(
        padding: EdgeInsets.all(0.5.h),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
