import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/view/screen/onboarding.dart';
import 'package:untitled3/view/screen/selectaccount.dart';
import 'package:untitled3/view/screen/stages_screen.dart';
import 'package:untitled3/view/screen/verificationform.dart';
import 'package:untitled3/view/screen/verificationstudentone.dart';
import 'package:untitled3/view/widget/customradiolisttile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      home: StageScreen(),
    );
  }
}
/*class Home1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: 300,width: double.infinity,
        child: Center(
        child: Image.asset("assets/images/1.jpg",fit: BoxFit.cover,),
      ),),
    );
  }
}*/
