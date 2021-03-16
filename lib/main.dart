import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';


void main() => runApp(AppCore());

class AppCore extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => NavigationBarState();
}

class NavigationBarState extends State<AppCore> {

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Color(0xFFf6ad3d),

      appBar: AppBar(title: Text("Helptonic", style: GoogleFonts.caveat(fontSize: 30)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,),

      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Color(0xFFb27300),
            selectedItemBackgroundColor: Color(0xFFb27300),
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: selectedIndex,
          onSelectTab: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.photo_library,
              label: 'Galeria',
            ),
            FFNavigationBarItem(
              iconData: Icons.camera_alt,
              label: 'Câmera',
            ),
            FFNavigationBarItem(
              iconData: Icons.people_alt,
              label: 'Teste',
            ),
          ],
       ),
      )
    );
  }
}