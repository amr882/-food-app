// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/screens/check_out/checkout_info.dart';
import 'package:food_app/screens/entry_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class PaymentSucess extends StatefulWidget {
  const PaymentSucess({super.key});

  @override
  State<PaymentSucess> createState() => _PaymentSucessState();
}

class _PaymentSucessState extends State<PaymentSucess> {
  addToOrders(BuildContext context) {
    final shop = context.read<CartProvider>();
    shop.moveCartToOrder();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 25.h,
            width: 25.h,
            child: const RiveAnimation.asset('images/success.riv'),
          ),
          Text('order Confirmed',
              style: GoogleFonts.nunito(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 2.h,
                  fontWeight: FontWeight.w900)),
          Text('Thank you for your order ',
              style: GoogleFonts.nunito(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 2.h,
                  fontWeight: FontWeight.w900)),
          SizedBox(
            height: 4.h,
          ),
          Button(
              onTap: () async {
                addToOrders(context);
                showDialog(
                  context: context,
                  builder: (context) => Center(
                      child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffFFFFFF),
                      ),
                      width: 70.w,
                      height: 30.h,
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffEDEDED),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            width: 70.w,
                            height: 8.h,
                            child: Center(
                                child: Text(
                              'Please note',
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w600, fontSize: 2.h),
                            )),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          const Text(
                            'The order will be delivered to :',
                            style: TextStyle(color: Color(0xff808080)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: const Divider(
                              color: Color(0xffe5e5e5),
                            ),
                          ),
                          Text(currrntLocation),
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                
                                  MaterialPageRoute(
                                      builder: (context) => const EntryPage()) , (route) => false,);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffFA4A0C),
                              ),
                              width: 30.w,
                              height: 6.2.h,
                              child: const Center(
                                  child: Text(
                                'Ok !',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                );
              },
              title: 'Done')
        ],
      ),
    );
  }
}
