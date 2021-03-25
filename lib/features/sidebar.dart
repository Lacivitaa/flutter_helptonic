import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Image.asset("assets/logoperfil.png"),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFab0000),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.create,
              color: Colors.black,
            ),
            title: Text('Editar dados',
                style:
                    GoogleFonts.coda(color: Colors.black, fontSize: 15)),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text('Email: '),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            title: Text('Email: '),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            title: Text('Nome: '),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            title: Text('Tipo de Daltonismo: '),
          ),
        ],
      ),
    );
  }
}
