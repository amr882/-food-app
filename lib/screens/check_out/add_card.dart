// ignore_for_file: avoid_print,, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/loading.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/screens/check_out/checkout_info.dart';
import 'package:food_app/screens/check_out/components/card_form.dart';
import 'package:food_app/screens/check_out/components/card_number.dart';
import 'package:food_app/screens/check_out/components/expired_date.dart';
import 'package:food_app/screens/check_out/components/method.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  // controllers
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiredDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //Keys
  GlobalKey<FormState> cardNumberKey = GlobalKey();
  GlobalKey<FormState> expiredDateKey = GlobalKey();
  GlobalKey<FormState> cvcKey = GlobalKey();
  GlobalKey<FormState> firstNameKey = GlobalKey();
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
                  top: screenHeight * 0.065,
                  right: screenWidth * 0.09),
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Text('Add New Card',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700, fontSize: 4.w))
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),

                  Row(
                    children: [
                      // name
                      Expanded(
                        child: CardForm(
                          textInputType: TextInputType.name,
                          controller: _nameController,
                          padding: 2.8,
                          hintText: 'Enter the information',
                          obscureText: false,
                          cardInfo: 'Name',
                          maxLength: null,
                          formState: firstNameKey,
                          onChanged: (value) {
                            setState(() {
                              name = _nameController.text;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'not valid.';
                            }

                            return null;
                          },
                          textInputFormatter: const [],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Choose Payment Method',
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      //master card
                      Method(
                          onTap: () {
                            setState(() {
                              selected = mastarCard;
                            });
                          },
                          image: mastarCard,
                          decoration: selected == mastarCard
                              ? BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(15))
                              :
                              ///////
                              BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 245, 245, 248),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 199, 199, 199),
                                  ),
                                  borderRadius: BorderRadius.circular(15))),
                      SizedBox(
                        width: 5.w,
                      ),
                      // visa
                      Method(
                          onTap: () {
                            setState(() {
                              selected = visa;
                            });
                          },
                          image: visa,
                          decoration: selected == visa
                              ? BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(15))
                              :
                              ///////
                              BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 245, 245, 248),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 199, 199, 199),
                                  ),
                                  borderRadius: BorderRadius.circular(15)))
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),

                  // card number
                  CardNumber(
                    controller: _cardNumberController,
                    padding: 3,
                    hintText: 'Enter the information',
                    obscureText: false,
                    cardInfo: 'Card Number',
                    maxLength: 19,
                    formState: cardNumberKey,
                    onChanged: (value) {
                      var numberText =
                          value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                      setState(() {
                        _cardNumberController.value =
                            _cardNumberController.value.copyWith(
                                text: numberText,
                                selection: TextSelection.collapsed(
                                    offset: numberText.length),
                                composing: TextRange.empty);
                        cardNumber = _cardNumberController.text;
                      });
                    },
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'not valid.';
                      } else if (_cardNumberController.text.length < 19) {
                        return "Card Number can not be less than 16";
                      }
                      return null;
                    },
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter(),
                    ],
                  ),

                  Row(
                    children: [
                      // expired date
                      Expanded(
                          child: ExpiryDate(
                        formState: expiredDateKey,
                        controller: _expiredDateController,
                        onChanged: (value) {
                          var text =
                              value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                          setState(() {
                            _expiredDateController.value =
                                _expiredDateController.value.copyWith(
                                    text: text,
                                    selection: TextSelection.collapsed(
                                        offset: text.length),
                                    composing: TextRange.empty);

                            expiredDate = _expiredDateController.text;
                          });
                        },
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          CardDateInputFormatter(),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'not valid.';
                          } else if (_expiredDateController.text.length < 5) {
                            return 'invalid expired date';
                          }
                          return null;
                        },
                      )),

                      // cvc number
                      Expanded(
                        child: CardForm(
                          textInputType: TextInputType.number,
                          controller: _cvcController,
                          padding: 2.8,
                          hintText: 'XXX',
                          obscureText: true,
                          cardInfo: 'CVC',
                          maxLength: 3,
                          formState: cvcKey,
                          onChanged: (value) {
                            setState(() {
                              cardcvc = _cvcController.text;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'not valid.';
                            } else if (_cvcController.text.length < 3) {
                              return "CVC can not be less than 3";
                            }
                            return null;
                          },
                          textInputFormatter: [
                            LengthLimitingTextInputFormatter(3),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                        height: 3.h,
                      ),

                  Button(
                      onTap: () async {
                        if (cardNumberKey.currentState!.validate() ||
                            expiredDateKey.currentState!.validate() ||
                            cvcKey.currentState!.validate() ||
                            firstNameKey.currentState!.validate()) {
                          setState(() {
                            saved = true;
                          });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Loading();
                            },
                          );
                          await Future.delayed(const Duration(seconds: 4));
                          print('++++++++++++++++++++++++++++++++++++++++++');
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const CheckoutInfo()));
                        } else {
                          print('no info');
                        }
                      },
                      title: 'Save Card')
                ]),
              ))),
    );
  }
}

//Strings
String cardNumber = '';
String expiredDate = '';
String cardcvc = '';
String name = '';
String mastarCard = 'images/Mastercard-Logo.wine.svg';
String visa = 'images/visa-svgrepo-com.svg';
String selected = mastarCard;

//bool
bool saved = false;
bool activated = true;
