import 'dart:convert';
import 'dart:io';

import 'package:ids_flutter_app/data/model/people.dart';
import 'package:ids_flutter_app/data/shared_database/read_data.dart';

class HomeController{
  List<People> listPeople;


  HomeController({this.listPeople});


  Future<List<People>> getListOfPeople() async {
      var data = await ReadData.readData('list');
      if(data != null){
        final decoded = json.decode(data) as List;
        return decoded.map((jsonTask) => People.fromJson(jsonTask)).toList();
      }
      return [];
  }
}