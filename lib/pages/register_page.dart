import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/features/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();
    final TextEditingController _controllerNome = TextEditingController();

    return Scaffold(
      appBar: buildAppBar("Registrar"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
                controller: _controllerEmail,
                style: GoogleFonts.coda(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                    labelText: "Email", icon: Icon(Icons.email)),
                keyboardType: TextInputType.text),
          ),
          TextField(
              controller: _controllerPassword,
              style: GoogleFonts.coda(color: Colors.black, fontSize: 15),
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha", icon: Icon(Icons.security)),
              keyboardType: TextInputType.text),
          TextField(
              controller: _controllerNome,
              style: GoogleFonts.coda(color: Colors.black, fontSize: 15),
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Nome", icon: Icon(Icons.accessibility)),
              keyboardType: TextInputType.text),
          ElevatedButton(
            child: Text("Registrar"),
            onPressed: () {
              final String email = _controllerEmail.text;
              final String password = _controllerPassword.text;
              final String nome = _controllerNome.text;

              if (email != null && password != null) {
              } else if (email == null) {
                _controllerEmail.clear();
              } else if (password == null) {
                _controllerPassword.clear();
              } else if (nome == null){
                _controllerNome.clear();
              }
            },
          )
        ],
      ),
    );
  }
}
