import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/controller/constant/color.dart';

class SelectAccount extends StatefulWidget{
  State<SelectAccount> createState() => SelectAccount1();
}
class SelectAccount1 extends State<SelectAccount>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(": اختر نوع الحساب ",style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          InkWell(
            child: Card(
              child: Row(
                children: [
                  Expanded(flex:1,
                      child: Icon(Icons.school,size: 40,color: AppColor.blue,)),
                  Expanded(flex: 3,
                      child: ListTile(
                    title: Text("حساب طالب"),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){print("object");},
            child: Card(
              color: Colors.yellowAccent,
              child: Row(
                children: [
                  Expanded(flex:1,
                      child: Icon(Icons.book_online,size: 40,color: AppColor.blue,)),
                  Expanded(flex: 3,
                      child: ListTile(
                        title: Text("حساب مدرس"),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}