
import 'package:flutter/material.dart';
import 'package:ids_flutter_app/data/model/people.dart';

class WPeople extends StatelessWidget{
  People people;

  WPeople({this.people});


  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.all(10),
        margin:  EdgeInsets.all(10),

    ) ;
  }

}