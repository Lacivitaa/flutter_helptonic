import 'dart:convert';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/features/side_bar.dart';
import 'package:flutter_ftt/features/single_child.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../features/main_app_bar.dart';

class NavigationBarState extends State<AppCore> {
  
  //Variaveis utilizadas
  int selectedIndex;
  int mainIndex = 1;
  var bytesimage;
  var imgdb;
  String base64in;
  var base64out;
  final picker = ImagePicker();

  //Build do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: SideDrawer(),
            backgroundColor: Color(0xFFFCFCFC),
            appBar: buildMainAppBar(),
            bottomNavigationBar: buildFfNavigationBar(),
            body: buildSingleChildScrollView()));
  }

  FFNavigationBar buildFfNavigationBar() {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Color(0xFFff3a3a),
        selectedItemBorderColor: Color(0xFFff3a3a),
        selectedItemBackgroundColor: Colors.white,
        selectedItemIconColor: Color(0xFFff3a3a),
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
        bytesimage = photo.readAsBytes();
        base64in = base64Encode(bytesimage);
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
      bytesimage = pickedFile.readAsBytes();
      base64in = base64Encode(bytesimage);
    } else {
      print('No image selected.');
    }
  }

  decodeImage() async {
    base64out = base64Decode(imgdb);
    return base64out;
  }
}