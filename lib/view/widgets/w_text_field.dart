
import 'package:flutter/material.dart';
import 'package:ids_flutter_app/view/styles/s_constants.dart';

class TextFieldWidget extends StatelessWidget{
  final TextEditingController value ;
  FormFieldValidator<String> validator;
  String label;
   IconButton icon;


  TextFieldWidget({this.value,this.label,this.validator,this.icon});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0) ,
      decoration: DecorationConstants.inputDecoration,
      child:TextFormField(
        controller: value,
        decoration:  InputDecoration(hintText: label,fillColor: Colors.white,suffixIcon: icon != null ? icon : null,),
        validator:validator,
      ),
    );
  }

}