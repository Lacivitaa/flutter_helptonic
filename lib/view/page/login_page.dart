import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/model/login.dart';
import 'package:flutter_ftt/repository/login_repository.dart';
import 'package:flutter_ftt/view/service/showDialog.dart';
import 'package:flutter_ftt/view/widget/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar("Login"),
      body: Column(
        children: [
          Editor(_controllerEmail, "Email", Icons.email, false),
          Editor(_controllerPassword, "Senha", Icons.security, true),
          ElevatedButton(
            style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            child: Text("Entrar"),
            onPressed: () {
               createLogin(_controllerEmail, _controllerPassword, context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> createLogin(TextEditingController _controllerEmail, TextEditingController _controllerPassword, BuildContext context) async {
    final String email = _controllerEmail.text.trim();
    final String password = _controllerPassword.text.trim();

    if (email != null && password != null) {
      final loginUser = Login(email: email, senha: password);
      LoginRepository userRepository = new LoginRepository();
      var user = await userRepository.loginUser(loginUser);
      
      if (user.message != null) {
        showMyDialog(context, "Login incorreto");
        _controllerEmail.clear();
        _controllerPassword.clear();
      }
      else
        Navigator.pop(context, loginUser);
    } else if (email == null) {
      _controllerEmail.clear();
      _controllerPassword.clear();
    } else if (password == null) {
      _controllerPassword.clear();
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _rotulo;
  final IconData _icon;
  final bool _senha;

  Editor(this._controller, this._rotulo, this._icon, this._senha);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextField(
        controller: _controller,
        style: GoogleFonts.coda(color: Colors.black, fontSize: 15),
        decoration: InputDecoration(labelText: _rotulo, icon: Icon(_icon)),
        keyboardType: TextInputType.text,
        obscureText: _senha,
      ),
    );
  }
}
