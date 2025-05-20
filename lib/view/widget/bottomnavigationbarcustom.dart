import 'package:flutter/cupertino.dart';

class BottomNavigationBarCustom {
  final Widget icon;
  final String label;

  BottomNavigationBarCustom({required this.icon, required this.label});

  BottomNavigationBarItem toItem() {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
