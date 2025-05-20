import 'package:flutter/cupertino.dart';

class BottomNavigationBarCustom extends StatelessWidget{
  @override
  final Widget? icon;
  final String? label;
  BottomNavigationBarCustom({ this.icon, this.label});
  Widget build (BuildContext context){
    return BottomNavigationBarItem(icon: ,label: "$label");
  }
}