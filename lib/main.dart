import 'package:flutter/material.dart';

import 'view/screens/home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ids',
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}
