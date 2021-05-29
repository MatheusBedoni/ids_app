

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ids_flutter_app/data/model/people.dart';
import 'package:ids_flutter_app/data/shared_database/read_data.dart';
import 'package:ids_flutter_app/data/shared_database/save_data.dart';
import 'package:ids_flutter_app/view/screens/home_page/s_home_page.dart';
import 'package:toast/toast.dart';

class IValidator{
  String validateName(String value) {}
  bool validateDataNascimento(String value){}
}


class IRegister{
  Future<bool> save(BuildContext context) async{}
}





class RegisterController implements IValidator, IRegister{
  TextEditingController ctrlName;
  GlobalKey<FormState> key;
  var sexo = [
    'M',
    'F',
  ];
  var sexoSelecionado = 'M';
  var dataNascimento = 'dia / mês / ano';

  RegisterController({this.ctrlName,this.key});

  @override
  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }else if (value.length > 70) {
      return "O nome deve ter menos que 70 letras";
    }
    return null;
  }

  @override
  bool validateDataNascimento(String value) {
    if(dataNascimento != 'dia / mês / ano'){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> save(BuildContext context) async {
    if (key.currentState.validate()) {
      if(validateDataNascimento(dataNascimento)){
        var listRead = await ReadData.getListMap('list');
        var listSet = await SaveData.setListMap(new People(id:listRead.length+1, nome: ctrlName.text, sexo:sexoSelecionado, dataNascimento:  dataNascimento),listRead);
        bool result = await SaveData.saveData(listSet, 'list');

        if(result == true){
          Toast.show("Deu tudo certo :D", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_) {
                  return MyHomePage() ;
                }
            ),
          );
        }else{
          Toast.show("Que estranho, um problema aconteceu :<", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

        }
      }else{
        Toast.show("Hey, você precisa adicionar tua data de nascimento :p", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

      }



      key.currentState.save();
    }


  }





}