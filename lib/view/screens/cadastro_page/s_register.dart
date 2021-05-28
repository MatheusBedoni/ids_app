



import 'package:flutter/material.dart';
import 'package:ids_flutter_app/view/styles/s_constants.dart';
import 'package:ids_flutter_app/view/widgets/w_button.dart';
import 'package:ids_flutter_app/view/widgets/w_text_field.dart';

import 'c_register.dart';

class  RegisterPage extends StatefulWidget {

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>  {
  RegisterController _registerController = new RegisterController();
  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
    _registerController.ctrlName.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
      ),
      body: SingleChildScrollView(
        child:  Container(
          width:  MediaQuery
              .of(context)
              .size
              .width,
          decoration: DecorationConstants.decorationBackground,
          child:  Form(
              key: _registerController.key,
              child:Column(
                children: <Widget>[
                  TextFieldWidget(value:_registerController.ctrlName,label:"nome",validator: _registerController.validateName),
                  SizedBox(height: 15.0),
                  GestureDetector(
                      onTap: () => _registerController.save(context),
                      child:ButtonWidget(titulo:'Adicionar')
                  )

                ],
              )
          ),
        ),
      ),
    );
  }




}