
import 'package:flutter/material.dart';
import 'package:ids_flutter_app/view/screens/cadastro_page/c_register.dart';
import 'package:ids_flutter_app/view/styles/s_constants.dart';

class TextFieldWidget extends StatelessWidget{
  final TextEditingController value ;
  FormFieldValidator<String> validator;
  String label;

  TextFieldWidget({this.value,this.label,this.validator});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0) ,
      decoration: DecorationConstants.textFieldDecoration,
      child:TextFormField(
        controller: value,
        decoration:  InputDecoration(hintText: label,fillColor: Colors.white),
        validator:validator,
      ),
    );
  }

}