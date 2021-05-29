import 'package:flutter/material.dart';
import 'package:ids_flutter_app/data/model/people.dart';

import 'w_people.dart';

class WListPeople extends StatelessWidget{
  List<People> peopleList;

  WListPeople({this.peopleList});


  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (_,int index)=>WPeople(people: peopleList[index]),
      itemCount: peopleList.length,
    );
  }

}