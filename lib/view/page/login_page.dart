import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/view/widget/app_bar.dart';
import 'package:flutter_ftt/view/page/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();

    return Scaffold(
      appBar: buildAppBar("Login"),
      body: Column(
        children: [
          Editor(_controllerEmail, "Email", Icons.email),
          Editor(_controllerPassword, "Senha", Icons.security),
          ElevatedButton(
            child: Text("Entrar"),
            onPressed: () {
              createLogin(_controllerEmail, _controllerPassword);
            },
          ),
          ElevatedButton(
            child: Text("Registrar"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return RegisterScreen();
              } ));
            },
          )
        ],
      ),
    );
  }

  void createLogin(TextEditingController _controllerEmail, TextEditingController _controllerPassword) {
    final String email = _controllerEmail.text;
    final String password = _controllerPassword.text;
    
    if (email != null && password != null) {
    } else if (email == null) {
      _controllerEmail.clear();
    } else if (password == null) {
      _controllerPassword.clear();
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
