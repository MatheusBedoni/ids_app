

import 'package:flutter/material.dart';

class IValidator{
  String validateName(String value) {}
}


class IRegister{
  Future<bool> save(BuildContext context) async{}
}





class RegisterController implements IValidator, IRegister{
  TextEditingController ctrlName;
  GlobalKey<FormState> key;

  RegisterController({this.ctrlName,this.key});

  @override
  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  @override
  Future<bool> save(BuildContext context) {

      throw UnimplementedError();
  }

}