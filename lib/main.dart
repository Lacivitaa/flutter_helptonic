import 'dart:io';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'features/appbar.dart';
import 'features/sidebar.dart';
import 'features/singlechild.dart';

void main() => runApp(AppCore());

class AppCore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavigationBarState();
}

class NavigationBarState extends State<AppCore> {
  //Variaveis utilizadas
  int selectedIndex;
  int mainIndex = 1;
  File imagem;
  final picker = ImagePicker();

  //Build do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: SideDrawer(),
            backgroundColor: Color(0xFFFCFCFC),
            appBar: buildAppBar(),
            bottomNavigationBar: buildFfNavigationBar(),
            body: buildSingleChildScrollView()));
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

        if (selectedIndex == 0) {
          getImage();
        } else if (selectedIndex == 2) {
          getFromGallery();
        }
      },
      items: [
        FFNavigationBarItem(
          iconData: Icons.camera_alt,
          label: 'Câmera',
        ),
        FFNavigationBarItem(
          iconData: Icons.people_alt,
          label: 'Teste',
        ),
        FFNavigationBarItem(
          iconData: Icons.photo_library,
          label: 'Galeria',
        ),
      ],
    );
  }

  Future getImage() async {
    final photo = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (photo != null) {
        imagem = File(photo.path);
        print(imagem);
      } else {
        print('No image selected.');
      }
    });
  }

  getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imagem = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
}

