import 'package:flutter/material.dart';
import 'package:ids_flutter_app/view/styles/s_constants.dart';

class ButtonWidget extends StatelessWidget{
  String titulo;

  ButtonWidget({this.titulo});
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin:  EdgeInsets.all(15.0),
        padding: EdgeInsets.all(10.0) ,
        decoration:DecorationConstants.buttonDecoration,
        child:Center(
          child:Text(titulo, style: TextStyle(
            fontWeight: FontWeight.bold,
            color:  Color(0xFFfff9f9),
            fontSize:  MediaQuery.of(context).size.height/65,
          ),) ,
        )
    );
  }

}