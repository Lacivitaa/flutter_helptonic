import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

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
            backgroundColor: Color(0xFFFCFCFC),
            appBar: buildAppBar(),
            bottomNavigationBar: buildFfNavigationBar(),
            body: buildSingleChildScrollView()));
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Informações",
                    style: GoogleFonts.coda(fontSize: 18, color: Colors.black)),
                SizedBox(height: 8),
                buildCardInfo(),
                SizedBox(height: 8),
                buildCardInfo(),
                SizedBox(height: 8),
                buildCardInfo(),
                SizedBox(height: 24),
              ],
            )),
          )
        ],
      ),
    );
  }

  buildCardInfo() {
    return Container(
      height: 200,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              right: 20,
              top: 20,
            ),
            height: 195,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFc5a6c0),
                  Color(0xFFa47b9e),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }

  FFNavigationBar buildFfNavigationBar() {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Color(0xFF42294a),
        selectedItemBorderColor: Color(0xFF42294a),
        selectedItemBackgroundColor: Colors.white,
        selectedItemIconColor: Color(0xFF42294a),
        selectedItemLabelColor: Colors.white,
        unselectedItemIconColor: Colors.white,
        unselectedItemLabelColor: Colors.white,
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
    );
  }

  AppBar buildAppBar() {
    return AppBar(
    title: SvgPicture.asset('assets/logo.svg', height:30),
    centerTitle: true,
    leading: IconButton(
        icon: SvgPicture.asset('assets/home.svg', height: 23), onPressed: null),
    actions: <Widget>[
      IconButton(icon: SvgPicture.asset('assets/people.svg',height: 23), onPressed: null)
    ],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    );
  }
}
