
import 'dart:convert';
import 'package:ids_flutter_app/data/model/people.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SaveData {

  static Future<bool> saveData(List list,String keys) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = json.encode(list);
    return await preferences.setString(keys,data);
  }

  static Future<List> setListMap(People people,List list) async {
    var map = people.toMap();
    list.add(map);
    return list;
  }
}