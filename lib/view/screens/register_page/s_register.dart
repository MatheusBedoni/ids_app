



import 'package:flutter/material.dart';
import 'package:ids_flutter_app/view/screens/home_page/s_home_page.dart';
import 'package:ids_flutter_app/view/styles/s_constants.dart';
import 'package:ids_flutter_app/view/widgets/w_button.dart';
import 'package:ids_flutter_app/view/widgets/w_text_field.dart';

import 'c_register.dart';
import 'package:intl/intl.dart';

class  RegisterPage extends StatefulWidget {

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>  {
  RegisterController _registerController = new RegisterController(ctrlName: new TextEditingController(),key: new GlobalKey());
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
          height:  MediaQuery
              .of(context)
              .size
              .height/1.12,
          decoration: DecorationConstants.decorationBackground,
          child:  Form(
              key: _registerController.key,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children:<Widget> [
                      SizedBox(height: 15.0),
                      Text('Qual o seu nome?'),
                      TextFieldWidget(value:_registerController.ctrlName,label:"nome",validator: _registerController.validateName),
                      SizedBox(height: 15.0),
                      Text('Qual o seu sexo?'),
                      Container(
                        margin:  EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(10.0) ,
                        width: double.infinity,
                        decoration: DecorationConstants.inputDecoration,
                        child: DropdownButton<String>(
                            items: _registerController.sexo.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),

                              );
                            }).toList(),
                            onChanged: (String novoItemSelecionado) {
                              _dropDownItemSelected(novoItemSelecionado);
                              setState(() {
                                this._registerController.sexoSelecionado = novoItemSelecionado;
                              });
                            },
                            value: _registerController.sexoSelecionado),
                      ),
                      SizedBox(height: 15.0),
                      Text('Qual a sua data de nascimento?'),
                      Container(
                        margin:  EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(20.0) ,
                        width: double.infinity,
                        decoration: DecorationConstants.inputDecoration,
                        child:GestureDetector(
                          onTap: (){
                            setData();
                          },
                          child:Text(_registerController.dataNascimento )
                        ) ,
                      )


                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      GestureDetector(
                          onTap: () =>showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>  AlertDialog(
                            title: const Text('Alerta'),
                            content: const Text('Você realmente deseja fechar a tela'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Não'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) {
                                        return MyHomePage();
                                      }
                                  ),
                                ),
                                child: const Text('Sim'),
                              ),
                            ],
                          ),
                          ),
                          child:ButtonWidget(titulo:'Cancelar',color: Colors.red.shade200,colorText: Colors.red,)
                      ),
                      GestureDetector(
                          onTap: () => _registerController.save(context),
                          child:ButtonWidget(titulo:'Adicionar',color: Colors.blue.shade200,colorText: Colors.blue,)
                      )
                    ],
                  )



                ],
              )
          ),
        ),
      ),
    );
  }


  Future<void> setData() async {
    DateFormat datain = DateFormat("dd/MM/yyyy");
    DateTime data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child);
      },
    );
    try{
      setState(() {
        _registerController.dataNascimento = datain.format(data);
      });
    }catch(e){
      print(e);
    }


 }
  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._registerController.sexoSelecionado = novoItem;
    });
  }



}