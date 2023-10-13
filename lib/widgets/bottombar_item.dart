import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final String icon;
  final bool isActive;
  final GestureTapCallback? onTap;

  const BottomBarItem({
    required this.icon,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.blue : Colors.transparent,
        ),
        child: Icon(
          Icons.home, // Replace with your desired icon
          color: isActive ? Colors.white : Colors.grey,
          size: 23,
        ),
      ),
    );
  }
}
