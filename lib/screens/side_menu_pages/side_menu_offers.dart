// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SideMenuOffers extends StatefulWidget {
  const SideMenuOffers({super.key});

  @override
  State<SideMenuOffers> createState() => _SideMenuOffersState();
}

class _SideMenuOffersState extends State<SideMenuOffers> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Offers'),),
    );
  }
}