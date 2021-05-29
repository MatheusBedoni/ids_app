

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



class ReadData {

  static Future<String> readData(String keys) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(keys);
  }

  static Future<List> getListMap(String keys) async {
    var data = await ReadData.readData(keys);
    if(data != null){
      var list = json.decode(data);
      return list;
    }else{
      return [];
    }
  }
}