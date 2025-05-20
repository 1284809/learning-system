import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/controller/constant/color.dart';

class HomePage extends StatefulWidget{
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int _CurrentIndex =0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _CurrentIndex,
          onTap: (index){
            setState(() {
              _CurrentIndex=index;
            });
          },
selectedItemColor: AppColor.blue,
          unselectedItemColor: Colors.grey[500],
          items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "الرئيسية",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.cast_for_education),
          label: "دروسي",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person),
          label: "الملف الشخصي",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),
          label: "الأشعارات",
        ),
      ] ),
    );
  }
}