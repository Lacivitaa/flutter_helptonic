import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/aws_s3/image_picker/single_image_picker.dart';
import 'package:flutter_ftt/view/widget/app_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

enum PhotoSource { ASSET, NETWORK }
enum PhotoStatus { LOADING, ERROR, LOADED }

class ImagePage extends StatefulWidget {
  PhotoSource photoSource;
  PhotoStatus photoStatus;
  String source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Envio de fotos"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: Colors.grey.shade200,
                        child: photoSource == PhotoSource.NETWORK
                            ? Image.network(source, height: 200)
                            : photoSource == PhotoSource.ASSET
                                ? Image.asset(source, height: 200)
                                : Container(
                                    color: Colors.grey.shade50, height: 200),
                      ),
                    ),
                    Center(
                      child: photoStatus == PhotoStatus.LOADING
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.red))
                          : photoStatus == PhotoStatus.ERROR
                              ? Icon(MaterialIcons.error,
                                  color: Colors.red, size: 40)
                              : Container(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  /* final SingleImagePicker singleImagePicker = SingleImagePicker(
                    pickImageSource: PickImageSource.both,
                    onImagePicked: (path) {
                      setState(() {
                        photoSource = PhotoSource.ASSET;
                        source = path;
                        photoStatus = PhotoStatus.LOADING;
                      });
                    },
                    onSaveImage: (String url) async {
                      print('On save image');
                      return false;
                    },
                    onImageSuccessfullySaved: (url) {
                      setState(() {
                        photoStatus = PhotoStatus.LOADED;
                        photoSource = PhotoSource.NETWORK;
                        source = url;
                      });
                      print('On image successfully saved');
                    },
                    onImageUploadFailed: (message) {
                      setState(() {
                        photoStatus = PhotoStatus.ERROR;
                      });
                      print('On image upload failed');
                    },
                  );
                  singleImagePicker.pickImage(context); */
                },
                child: Text("Selecione uma imagem"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color:  Colors.red.shade200))
                  )
                )
                
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    
  }
}