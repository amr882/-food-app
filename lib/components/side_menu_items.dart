import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SideMenuItems extends StatelessWidget {
  final String itemName;
  final String itemIcon;
  final VoidCallback? onTap;
  const SideMenuItems(
      {super.key, required this.itemName, required this.itemIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            itemIcon,
            height: screenHeight * 0.029,
          ),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          Text(
            itemName,
            style: TextStyle(fontSize: 3.5.w, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class ItemDivider extends StatelessWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 5.5.h,
      child: Padding(
          padding: EdgeInsets.only(
              right: screenWidth * 0.114, left: screenWidth * 0.056),
          child: const Divider(
            thickness: 0.5,
            color: Color.fromARGB(255, 255, 255, 255),
          )),
    );
  }
}
