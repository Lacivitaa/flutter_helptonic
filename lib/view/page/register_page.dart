import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/model/api_response.dart';
import 'package:flutter_ftt/model/register.dart';
import 'package:flutter_ftt/model/user.dart';
import 'package:flutter_ftt/repository/register_repository.dart';
import 'package:flutter_ftt/repository/user_repository.dart';
import 'package:flutter_ftt/view/service/alertDialog.dart';
import 'package:flutter_ftt/view/widget/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();
    final TextEditingController _controllerNome = TextEditingController();
    final TextEditingController _controllerTipo = TextEditingController();

    return Scaffold(
      appBar: buildAppBar("Registrar"),
      body: Column(
        children: [
          Editor(_controllerEmail, "Email", Icons.email),
          Editor(_controllerPassword, "Senha", Icons.security),
          Editor(_controllerNome, "Nome", Icons.person_add),
          Editor(_controllerTipo, "Tipo", Icons.adjust),
          ElevatedButton(
            child: Text("Registrar"),
            onPressed: () {
              createRegister(_controllerEmail, _controllerPassword, _controllerNome, _controllerTipo, context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void createRegister(TextEditingController _controllerEmail, TextEditingController _controllerPassword, TextEditingController _controllerNome,TextEditingController _controllerTipo, BuildContext context) async {
    final String email = _controllerEmail.text;
    final String password = _controllerPassword.text;
    final String nome = _controllerNome.text;
    final String tipo = _controllerTipo.text;
    
    if (email != null && password != null) {
      final registerUser = Register(email: email, senha: password, nome: nome, tipoDalt: tipo);
      RegisterRepository registerRepository = new RegisterRepository();
      var user = await registerRepository.registerUser(registerUser);
      if (user.error != null) {
        showDialog(context: context, builder: (BuildContext context) => alertDialog(context, 'Informações erradas/faltando'));
        _controllerEmail.clear();
        _controllerPassword.clear();
      }
    } else if (email == null) {
      _controllerEmail.clear();
    } else if (password == null) {
      _controllerPassword.clear();
    } else if (nome == null){
      _controllerNome.clear();
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController _controller;
  final String _rotulo;
  final IconData _icon;

  Editor(this._controller,this._rotulo, this._icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: _controller,
        style: GoogleFonts.coda(color: Colors.black, fontSize: 15),
        decoration:
            InputDecoration(labelText: _rotulo, icon: Icon(_icon)),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

