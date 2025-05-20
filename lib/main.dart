import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:untitled3/view/screen/onboarding.dart';
import 'package:untitled3/view/screen/selectaccount.dart';
import 'package:untitled3/view/screen/stages_screen.dart';
import 'package:untitled3/view/screen/verificationform.dart';
import 'package:untitled3/view/screen/verificationstudentone.dart';
=======
import 'package:untitled3/view/screen/Student/HomePage.dart';
import 'package:untitled3/view/screen/Student/complete.dart';
import 'package:untitled3/view/screen/Student/completeregister.dart';
import 'package:untitled3/view/screen/Student/onboarding.dart';
import 'package:untitled3/view/screen/Student/selectaccount.dart';
import 'package:untitled3/view/screen/Student/verificationform.dart';
import 'package:untitled3/view/screen/Student/verificationstudentone.dart';
>>>>>>> 1232d01 (CompleteForm)
import 'package:untitled3/view/widget/customradiolisttile.dart';

void main() {
  runApp(MyApp());
}
<<<<<<< HEAD
=======
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
>>>>>>> 1232d01 (CompleteForm)

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
