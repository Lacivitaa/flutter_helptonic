import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/aws_s3/image_picker/single_image_picker.dart';
import 'package:flutter_ftt/view/widget/side_bar.dart';
import 'package:flutter_ftt/view/widget/single_child.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/user_const.dart'; 

import '../../main.dart';
import '../widget/main_app_bar.dart';

class FirstPageState extends State<AppCore> {
  String source;
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
            body: Container(
              child: Column(
                children: [
                  buildSingleChildScrollView(update),
                  SizedBox(height: 14),
                  Visibility(child: Text("Novas fotos podem ser adicionadas",
                  style: GoogleFonts.coda(fontSize: 18, color: Colors.black), textAlign: TextAlign.left,),
                  visible: UserConst.imageCarousel),
                  SizedBox(height: 8),
                  Visibility(
                    visible: UserConst.imageCarousel,
                    child: Container(
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      onPressed: () async {
                        final SingleImagePicker singleImagePicker =
                            SingleImagePicker(
                          pickImageSource: PickImageSource.both,
                          onImagePicked: (path) {
                          },
                          onSaveImage: (String url) async {
                          },
                          onImageSuccessfullySaved: (url) {
                          },
                          onImageUploadFailed: (message) {
                          },
                        );
                        singleImagePicker.pickImage(context);
                      },
                      child: Text('Adicionar imagem'),
                    )),
                  )
                ],
              ),
            )));
  }
}
/*
floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xFFff3a3a),
                child: new Icon(Icons.add),
                onPressed: () async {
                  final SingleImagePicker singleImagePicker = SingleImagePicker(
                    pickImageSource: PickImageSource.both,
                    onImagePicked: (path) {
                      /* setState(() {
                        photoSource = PhotoSource.ASSET;*/
                        source = path;
                        /*photoStatus = PhotoStatus.LOADING;
                      }); */
                      log("Etapa 1");
                    },
                    onSaveImage: (String url) async {
                      log('On save image');
                      return false;
                    },
                    onImageSuccessfullySaved: (url) {
                      /* setState(() {
                        photoStatus = PhotoStatus.LOADED;
                        photoSource = PhotoSource.NETWORK; */
                        source = url;
                     /*  }); */
                      log('On image successfully saved');
                    },
                    onImageUploadFailed: (message) {
                      /* setState(() {
                        photoStatus = PhotoStatus.ERROR;
                      }); */
                      log('On image upload failed');
                    },
                  );
                  singleImagePicker.pickImage(context);
                },),


/* class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
        /* showBottomSheet(
            context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text('Camera'),
                  onTap: (){},
                ),
                ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Galeria'),
                  onTap: () {},
                ),
              ],
            );
          }); */
      },
    );
  } */
} */
