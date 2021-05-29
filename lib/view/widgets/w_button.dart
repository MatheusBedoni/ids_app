import 'package:flutter/material.dart';
import 'package:ids_flutter_app/view/styles/s_constants.dart';

class ButtonWidget extends StatelessWidget{
  String titulo;
  Color color;
  Color colorText;

  ButtonWidget({this.titulo,this.color,this.colorText});
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin:  EdgeInsets.all(15.0),
        padding: EdgeInsets.all(20.0) ,
        decoration:DecorationConstants.getbuttonDecoration(color),
        child:Center(
          child:Text(titulo, style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorText,
            fontSize:  MediaQuery.of(context).size.height/65,
          ),) ,
        )
    );
  }

}