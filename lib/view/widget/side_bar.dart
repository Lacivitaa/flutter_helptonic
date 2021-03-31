import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/model/client.dart';
import 'package:flutter_ftt/model/login.dart';
import 'package:flutter_ftt/view/page/login_page.dart';
import 'package:flutter_ftt/view/page/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Image.asset("assets/logoperfil.png",scale: 5),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFab0000),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
            title: Text('Login',
                style:
                    GoogleFonts.coda(color: Colors.black, fontSize: 15)),
                    onTap: (){
                      final Future <Login> future  = Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginScreen();
                      }));
                      future.then((loginofuser) {
                        debugPrint("Login realizado ! = User: " + loginofuser.toString());
                      });
                    },
          ),
          ListTile(
            leading: Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
            title: Text('Registrar',
                style:
                    GoogleFonts.coda(color: Colors.black, fontSize: 15)),
                    onTap: (){
                      final Future <User> future  = Navigator.push(context, MaterialPageRoute(builder: (context){
                        return RegisterScreen();
                      }));
                      future.then((loginofuser) {
                        debugPrint("User registrado ! = User: " + loginofuser.toString());
                      });
                    },
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.black,
            ),
            title: Text('Email: '),
          ),
          ListTile(
            leading: Icon(
              Icons.accessibility,
              color: Colors.black,
            ),
            title: Text('Nome: '),
          ),
          ListTile(
            leading: Icon(
              Icons.adjust,
              color: Colors.black,
            ),
            title: Text('Tipo: '),
          ),
        ],
      ),
    );
  }
}
