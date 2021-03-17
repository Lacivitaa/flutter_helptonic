import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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

          //bottomNavigationBar: buildNavigationBar(),

          body: SingleChildScrollView(
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
                      Text("Funcionalidades",
                          style: GoogleFonts.coda(
                              fontSize: 18, color: Colors.black)),
                      SizedBox(height: 20),
                      buildFunctions(),
                      SizedBox(height: 8),
                      buildCardInfo(),
                      SizedBox(height: 8),
                      buildCardInfo(),
                      SizedBox(height: 8),
                      buildCardInfo(),
                    ],
                  )),
                )
              ],
            ),
          ),
        ));
  }

  //Metodos para criação dos componentes
  FFNavigationBar buildNavigationBar() {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.white,
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
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Helptonic', style: GoogleFonts.coda(fontSize: 20, color: Color(0xFFf9be51))),
      centerTitle: true,
      leading: IconButton(
          icon: SvgPicture.asset('assets/home.svg', height: 35), onPressed: null),
      actions: <Widget>[
        IconButton(icon: SvgPicture.asset('assets/people.svg'), onPressed: null)
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  buildCardInfo() {
    return Container(
      height: 200,
      width:double.infinity,
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
                  Color(0xFFc79840),
                  Color(0xFFF9BE51),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}

Row buildFunctions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FunctionCard(
        imageSrc: "assets/gallery2.svg",
        title: "Galeria"),
      FunctionCard(
        imageSrc: "assets/camera2.svg",
        title: "Câmera"),
      FunctionCard(
        imageSrc: "assets/survey2.svg",
        title: "Pesquisa"),
    ],
  );
}

class FunctionCard extends StatelessWidget {
  final String imageSrc;
  final String title;
  const FunctionCard({
    Key key,
    this.imageSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(imageSrc, width: 80),
        SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.coda(fontSize: 15, color: Colors.black),
        )
      ],
    );
  }
}