import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/view/widget/customradiolisttile.dart';

class VerificationStudentOne extends StatefulWidget{
  State<VerificationStudentOne> createState()=>VerificationStudentOne1();
}
class VerificationStudentOne1 extends State<VerificationStudentOne>{
  @override
  String? Phase;
  Widget build(BuildContext context){
    return Scaffold(
body: Padding(padding: EdgeInsets.all(10),
child: ListView(
  children: [
    CustomRadioListTile(Value: "ابتدائي", GroupValue: Phase,)
  ],
)
),
    );
  }
}