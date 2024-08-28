// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SideMenuSecurity extends StatefulWidget {
  const SideMenuSecurity({super.key});

  @override
  State<SideMenuSecurity> createState() => _SideMenueSecurityState();
}

class _SideMenueSecurityState extends State<SideMenuSecurity> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('security'),
      ),
    );
  }
}
