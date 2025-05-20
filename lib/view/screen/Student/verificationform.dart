import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/controller/constant/color.dart';
import 'package:untitled3/controller/constant/color.dart';

import '../../../controller/functions/verification.dart';

class VerificationForm extends StatefulWidget{
  State<VerificationForm> createState() => Verification_Form();
}
class Verification_Form extends State<VerificationForm>{
  final TextEditingController numbercontroller =TextEditingController();
  bool show_verificationfeild = false;
  void OnNumberChanged (String val){
    if(val.length==10){
      setState(() {
        show_verificationfeild=true;
      });
    }
    else{
      setState(() {
       // show_verificationfeild=false;
      });
      //TextFormField();

    }
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: numbercontroller,
              keyboardType: TextInputType.number,

              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)],
              decoration: InputDecoration(
                hintText: "أدخل رقم الهاتف",
                  //labelText:'10' ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColor.blue),
                )
              ),
              onChanged: (value){
                setState(() {
                  show_verificationfeild=value.length>=10;
                });
              },
            ),
            SizedBox(height: 20,),
             /*  Visibility(
                 visible: show_verificationfeild,
                 child: TextFormField(),
               ),*/
               InkWell(

              onTap: (){
               

              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                //height: 20,
                alignment: Alignment.center,
                child: Text("سجل",style: TextStyle(color: AppColor.white,fontSize: 20),),
                color: AppColor.blue,
              ),
            ),



          ],
        ),
      ),
    );
  }
}