import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRadioListTile extends StatelessWidget{
  @override
  final String? Value;
  final String? GroupValue;
  const CustomRadioListTile({required this.Value,required this.GroupValue});
  Widget build(BuildContext context){
    return RadioListTile(value: Text("$Value"),
        groupValue: Text("$GroupValue"),
        onChanged: (val){

        });
  }
}