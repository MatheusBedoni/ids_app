
import 'package:flutter/material.dart';
import 'package:ids_flutter_app/view/screens/register_page/s_register.dart';
import 'package:ids_flutter_app/view/styles/s_constants.dart';
import '../../widgets/w_list_people.dart';
import 'c_home_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController homeController = new HomeController(listPeople: []);
  bool loading = true;

  @override
  void initState() {

    getPeoples();
    super.initState();
  }


  getPeoples() async {
    var result = await homeController.getListOfPeople() ;
    setState(() {
      homeController.listPeople = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de pessoas'),
      ),
      body:Container(
        height:  MediaQuery
            .of(context)
            .size
            .height/1.12,
        decoration: DecorationConstants.decorationBackground,
        child:      loading == true ?
        Center(child:Text('Carregando')) :
        homeController.listPeople.length > 0 ?
         WListPeople(peopleList: homeController.listPeople,) :
        Center(child:Text('Nenhuma pessoa cadastrada')),
      ),



      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) {
                  return RegisterPage();
                }
            ),
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
