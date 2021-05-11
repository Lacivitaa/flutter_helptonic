import 'dart:io';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/aws_s3/image_picker/single_image_picker.dart';
import 'package:flutter_ftt/repository/photo_repository.dart';
import 'package:flutter_ftt/view/widget/side_bar.dart';
import 'package:flutter_ftt/view/widget/single_child.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../widget/main_app_bar.dart';

class NavigationBarState extends State<AppCore> {
  //Variaveis utilizadas
  Source source = Source.NONE;
  int selectedIndex;
  int mainIndex = 1;
  var imgdb;
  String base64in;
  var base64out;
  final picker = ImagePicker();
  bool update;

  //Build do aplicativo
  @override
  Widget build(BuildContext context) {
    setState(() {});

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: SideDrawer(),
            backgroundColor: Color(0xFFFCFCFC),
            appBar: buildMainAppBar(),
            bottomNavigationBar: buildFfNavigationBar(),
            body: buildSingleChildScrollView(update)));
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
        } else if (selectedIndex == 1) {
          PhotoRepository photoRepository = new PhotoRepository();
          photoRepository.postPhoto('TESTE.png');
        } else if (selectedIndex == 2) {}
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

  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
