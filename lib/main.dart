import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(AppCore());

class AppCore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavigationBarState();
}

class NavigationBarState extends State<AppCore> {
  
  //Variaveis utilizadas
  int selectedIndex = 1;

  //Build do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          backgroundColor: Color(0xFFf6ad3d),

          appBar: AppBar(
            title: Image.asset('assets/logosolo.png', height: 23),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
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

          body: Center(
            child: ListView(
              children: <Widget>[
                new Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                new CircularPercentIndicator(
                  radius: 300.0,
                  lineWidth: 27.0,
                  percent: 1.0,
                  center: Image.asset('assets/logoextend.png',width: 125),
                  progressColor: Color(0xFFffdb99),
                )
              ],
            ),
          )
        ));
  }
}
