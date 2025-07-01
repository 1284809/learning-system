import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/view/screen/Student/HomePage.dart';
import 'package:untitled3/view/screen/Student/complete.dart';
import 'package:untitled3/view/screen/Student/completeregister.dart';
import 'package:untitled3/view/screen/Student/onboarding.dart';
import 'package:untitled3/view/screen/Student/selectaccount.dart';
import 'package:untitled3/view/screen/Student/verificationform.dart';
import 'package:untitled3/view/screen/Student/verificationstudentone.dart';
import 'package:untitled3/view/screen/Student/stages_screen.dart';
import 'package:untitled3/view/screen/addpostscreen.dart';
import 'package:untitled3/view/screen/postsScreen.dart';
import 'package:untitled3/view/screen/productscreen.dart';
import 'package:untitled3/view/widget/customradiolisttile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Products(),
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
