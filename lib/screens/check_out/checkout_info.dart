import 'package:flutter/material.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/loading.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/screens/check_out/components/my_card.dart';
import 'package:food_app/screens/check_out/components/payment_sucess.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:food_app/screens/check_out/add_card.dart';

class CheckoutInfo extends StatefulWidget {
  const CheckoutInfo({super.key});

  @override
  State<CheckoutInfo> createState() => _CheckoutInfoState();
}

class _CheckoutInfoState extends State<CheckoutInfo> {
  bool enabled = false;
  Position? position;
  int _retryCount = 0;
  static const int _maxRetries = 3;
  bool cashOnReceive = false;

  Future<void> getLocationFromCoordinates() async {
    do {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position!.latitude, position!.longitude);
        Placemark places = placemarks[0];
        setState(() {
          currrntLocation =
              '${places.street}, ${places.locality}, ${places.country}';
        });
        return;
      } catch (error) {
        _retryCount++;
        print("Error getting location ($_retryCount): $error");
        if (_retryCount < _maxRetries) {
          await Future.delayed(const Duration(seconds: 2));
        } else {
          return;
        }
      }
    } while (true);
  }

  late LocationPermission permission;
  Future<Position> determinePosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    } else {
      print('done');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      print('done');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } else {
      print('done');
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      setState(() {
        enabled = true;
      });
    }
    return await Geolocator.getCurrentPosition();
  }

  location() async {
    position = await determinePosition();
    await getLocationFromCoordinates();
    print(position);
    print('+++++++++++++ $currrntLocation');
  }

  @override
  void initState() {
    determinePosition();
    location();
    getLocationFromCoordinates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<CartProvider>(
      builder: (BuildContext context, CartProvider value, Widget? child) =>
          Scaffold(
        backgroundColor: const Color(0xffF5F5F8),
        body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.092,
              top: screenHeight * 0.0999,
              right: screenWidth * 0.09),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    Text('Checkout',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w700, fontSize: 4.5.w))
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text('Shipping to',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: screenWidth * 0.07293,
                                offset: const Offset(0, 5),
                                color:
                                    const Color.fromARGB(255, 209, 207, 207)),
                          ]),
                      child: Image.asset(
                        'images/Group 67.png',
                        height: 10.h,
                      ),
                    ),
                    SizedBox(
                      width: 2.5.h,
                    ),
                    SizedBox(
                      width: 20.h,
                      child: Text(
                        enabled
                            ? currrntLocation
                            : 'please tap here to get your current address',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Text('Add Payment Method',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                saved
                    ? const MyCard()
                    : GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddCard()));
                        },
                        child: Container(
                          width: 80.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffd9d9d9),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: screenWidth * 0.07293,
                                    offset: const Offset(0, 5),
                                    color: const Color.fromARGB(
                                        255, 209, 207, 207)),
                              ]),
                          child: const Center(
                              child: Text('Start Adding Your Card')),
                        ),
                      ),
                SizedBox(
                  height: 5.h,
                ),
                saved
                    ? SizedBox(
                        height: 3.6.h,
                      )
                    : Row(
                        children: [
                          Checkbox(
                              activeColor: const Color(0xffFA4A0C),
                              value: cashOnReceive,
                              onChanged: (val) {
                                setState(() {
                                  cashOnReceive = val!;
                                });
                                print(cashOnReceive);
                              }),
                          const Text('cash On Receive')
                        ],
                      ),
                SizedBox(
                  height: 3.h,
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
                Button(
                    onTap: () async {
                      if (cashOnReceive == true) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Loading();
                          },
                        );
                        await Future.delayed(const Duration(seconds: 4));
                        print('++++++++++++++++++++++++++++++++++++++++++');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const PaymentSucess()));
                      }

                      if (cardNumber == '' ||
                          name == '' ||
                          expiredDate == '' ||
                          cardcvc == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 51, 51, 51),
                                duration: Duration(seconds: 1),
                                content: Center(
                                  child: Text(
                                      'please add your card or select cash On Receive'),
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Loading();
                          },
                        );
                        await Future.delayed(const Duration(seconds: 4));
                        print('++++++++++++++++++++++++++++++++++++++++++');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const PaymentSucess()));
                      }
                    },
                    title: 'Confirm Order')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String currrntLocation = '';
