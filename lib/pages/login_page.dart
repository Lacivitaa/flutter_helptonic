import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/features/app_bar.dart';
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: _controllerEmail,
              style: GoogleFonts.coda(color: Colors.black, fontSize: 15),
              decoration:
                  InputDecoration(labelText: "Email", icon: Icon(Icons.email)),
              keyboardType: TextInputType.text,
            ),
          ),
          TextField(
            controller: _controllerPassword,
            style: GoogleFonts.coda(color: Colors.black, fontSize: 15),
            obscureText: true,
            decoration:
                InputDecoration(labelText: "Senha", icon: Icon(Icons.security)),
            keyboardType: TextInputType.text,
          ),
          ElevatedButton(
            child: Text("Entrar"),
            onPressed: () {
              final String email = _controllerEmail.text;
              final String password = _controllerPassword.text;
            },
          )
        ],
      ),
    );
  }
}
