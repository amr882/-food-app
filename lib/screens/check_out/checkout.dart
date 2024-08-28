// // ignore_for_file: avoid_print, use_build_context_synchronously
// import 'package:food_app/components/loading.dart';
// import 'package:food_app/screens/check_out/checkout_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:food_app/components/button.dart';
// import 'package:food_app/models/cart.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';

// class CheckOut extends StatefulWidget {
//   const CheckOut({super.key});

//   @override
//   State<CheckOut> createState() => _CheckOutState();
// }

// class _CheckOutState extends State<CheckOut> {
//   String? paymentMethod;
//   String? deliveryMethod;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//         backgroundColor: const Color(0xffF5F5F8),
//         body: Padding(
//           padding: EdgeInsets.only(
//               left: screenWidth * 0.092,
//               top: screenHeight * 0.0999,
//               right: screenWidth * 0.09,
//               bottom: 2.2.h),
//           child: Stack(children: [
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(const Cart());
//                       },
//                       icon: const Icon(Icons.arrow_back_ios_new_rounded),
//                     ),
//                     SizedBox(
//                       width: 19.w,
//                     ),
//                     Text('Checkout',
//                         style: GoogleFonts.nunito(
//                             fontWeight: FontWeight.w700, fontSize: 4.5.w))
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 5.w, bottom: 2.h),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Payment',
//                         style: GoogleFonts.nunito(
//                             fontWeight: FontWeight.w700, fontSize: 6.5.w),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 5.w, bottom: 2.h, top: 2.3.h),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Payment method',
//                         style: GoogleFonts.nunito(
//                             fontWeight: FontWeight.w700, fontSize: 3.w),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color(0xffFFFFFF)),
//                   width: 75.w,
//                   height: 23.h,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 2.h),
//                     child: Column(
//                       children: [
//                         RadioListTile(
//                           title: Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(right: 2.w),
//                                 child: Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(1.h),
//                                         color: const Color(0xffF47B0A)),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(1.6.h),
//                                       child: SvgPicture.asset(
//                                         'images/Vector (2).svg',
//                                         height: 2.h,
//                                       ),
//                                     )),
//                               ),
//                               const Text('card'),
//                             ],
//                           ),
//                           activeColor: const Color(0xffFA4A0C),
//                           value: 'Card',
//                           groupValue: paymentMethod,
//                           onChanged: (value) => setState(() {
//                             paymentMethod = value;
//                           }),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 17.w),
//                           child: const Divider(),
//                         ),
//                         RadioListTile(
//                           title: Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(right: 2.w),
//                                 child: Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(1.h),
//                                         color: const Color(0xffEB4796)),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(1.95.h),
//                                       child: SvgPicture.asset(
//                                         'images/Vector (3).svg',
//                                         height: 2.h,
//                                       ),
//                                     )),
//                               ),
//                               const Text('cash on delivery'),
//                             ],
//                           ),
//                           activeColor: const Color(0xffFA4A0C),
//                           value: 'cash on delivery',
//                           groupValue: paymentMethod,
//                           onChanged: (value) => setState(() {
//                             paymentMethod = value;
//                           }),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 5.w, bottom: 2.h, top: 2.3.h),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Delivery method',
//                         style: GoogleFonts.nunito(
//                             fontWeight: FontWeight.w700, fontSize: 3.w),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color(0xffFFFFFF)),
//                   width: 75.w,
//                   height: 20.h,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 2.h),
//                     child: Column(
//                       children: [
//                         RadioListTile(
//                           title: const Text('Door Delivery'),
//                           activeColor: const Color(0xffFA4A0C),
//                           value: 'Door Delivery',
//                           groupValue: deliveryMethod,
//                           onChanged: (value) => setState(() {
//                             deliveryMethod = value;
//                           }),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 17.w),
//                           child: const Divider(),
//                         ),
//                         RadioListTile(
//                           title: const Text('Pick Up'),
//                           activeColor: const Color(0xffFA4A0C),
//                           value: 'Pick Up',
//                           groupValue: deliveryMethod,
//                           onChanged: (value) => setState(() {
//                             deliveryMethod = value;
//                           }),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Button(
//                     onTap: () async {
//                       if (paymentMethod != null && deliveryMethod != null) {
//                         print('done');
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 backgroundColor:
//                                     Color.fromARGB(255, 51, 51, 51),
//                                 duration: Duration(seconds: 1),
//                                 content: Center(
//                                   child: Text(
//                                       'please select paymentMethod deliveryMethod'),
//                                 )));
//                       }

//                       if (paymentMethod == 'Card') {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return const Loading();
//                           },
//                         );
//                         await Future.delayed(const Duration(seconds: 4));
//                         print('++++++++++++++++++++++++++++++++++++++++++');
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (context) => const CheckoutInfo()));
//                       }
//                     },
//                     title: 'Proceed to payment')
//               ],
//             ),
//           ]),
//         ));
//   }
// }
