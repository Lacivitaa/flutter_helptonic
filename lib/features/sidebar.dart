import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nome;
    int idade;
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Perfil do usuário',
                textAlign: TextAlign.center,
                style: GoogleFonts.coda(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF42294a),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.create,
              color: Color(0xFF42294a),
            ),
            title: Text('Editar dados',
                style:
                    GoogleFonts.coda(color: Color(0xFF42294a), fontSize: 15)),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Color(0xFF42294a),
            ),
            title: Text('Nome: '),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Color(0xFF42294a),
            ),
            title: Text('Idade: '),
          ),
        ],
      ),
    );
  }
}
