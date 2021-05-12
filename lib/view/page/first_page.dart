import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/aws_s3/image_picker/single_image_picker.dart';
import 'package:flutter_ftt/repository/photo_repository.dart';
import 'package:flutter_ftt/view/page/image_page.dart';
import 'package:flutter_ftt/view/widget/side_bar.dart';
import 'package:flutter_ftt/view/widget/single_child.dart';

import '../../main.dart';
import '../widget/main_app_bar.dart';

class FirstPageState extends State<AppCore> {
  //Variaveis utilizadas
  Source source = Source.NONE;
  int selectedIndex;
  String base64in;
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
            bottomNavigationBar: buildFfNavigationBar(context),
            floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
            floatingActionButton: buildFloatingActionButton(context),
            body: buildSingleChildScrollView(update)));
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return new FloatingActionButton(
        onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return ImagePage();
                  }));}, 
        backgroundColor: Colors.red[300],
        child: new Icon(Icons.add),
        );
  }

  FFNavigationBar buildFfNavigationBar(BuildContext context) {
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
          photoRepository.postPhoto('nova.jpg');
        } else if (selectedIndex == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ImagePage();
          }));
        }
      },
      items: [
        FFNavigationBarItem(
          iconData: Icons.camera_alt,
          label: 'Câmera',
        ),
        FFNavigationBarItem(
          iconData: Icons.photo_library,
          label: 'Galeria',
        ),
      ],
    );
  }
}
