import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/aws_s3/aws/upload_files.dart';
import 'package:flutter_ftt/constant/user_const.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'package:flutter_ftt/main.dart';
import 'add_attachment_sheet.dart';
import 'get_image_permission.dart';

typedef Future<bool> OnSaveImage(String url);

enum Source { GALLERY, CAMERA, NONE }

class SingleImagePicker {
  final PickImageSource pickImageSource;
  final Function(String path) onImagePicked;
  final Function(String downloadUrl) onImageSuccessfullySaved;
  final OnSaveImage onSaveImage;
  final Function(String message) onImageUploadFailed;

  SingleImagePicker({
    this.pickImageSource = PickImageSource.both,
    @required this.onImagePicked,
    @required this.onSaveImage,
    @required this.onImageSuccessfullySaved,
    @required this.onImageUploadFailed,
  });

  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage(context) async {
    try {
      ImageSource imageSource;

      if (pickImageSource == PickImageSource.both) {
        Size size = MediaQuery.of(context).size;
        var sheet = AddAttachmentModalSheet(size);
        await showModalBottomSheet(
          context: context,
          builder: (context) => sheet,
          isScrollControlled: true,
        );

        if (sheet.source == Source.CAMERA) {
          imageSource = ImageSource.camera;
        } else if (sheet.source == Source.GALLERY) {
          imageSource = ImageSource.gallery;
        } else {
          return;
        }
      } else if (pickImageSource == PickImageSource.camera) {
        imageSource = ImageSource.camera;

        GetImagePermission getPermission = GetImagePermission.camera();
        await getPermission.getPermission(context);

        if (getPermission.granted == false) {
          //Permission is not granted
          return;
        }
      } else if (pickImageSource == PickImageSource.gallery) {
        imageSource = ImageSource.gallery;

        GetImagePermission getPermission = GetImagePermission.gallery();
        await getPermission.getPermission(context);

        if (getPermission.granted == false) {
          //Permission is not granted
          return;
        }
      } else {
        return;
      }

      PickedFile image = await imagePicker.getImage(source: imageSource);

     /*  if (image != null) {
        onImagePicked?.call(image.path);} */

        /* String fileExtension = path.extension(image.path); */

        /* GenerateImageUrl generateImageUrl = GenerateImageUrl();
        await generateImageUrl.call(fileExtension);

        String uploadUrl;
        if (generateImageUrl.isGenerated != null &&
            generateImageUrl.isGenerated) {
          uploadUrl = generateImageUrl.uploadUrl;
        } else {
          throw generateImageUrl.message;
        } */

        /* PhotoRepository repository = PhotoRepository();
        bool isUploaded =
            await repository.postPhoto(generateImageUrl.downloadUrl);
        if (!isUploaded) {
          throw "Failed to upload image";
        } */

        UploadFile uploadFile = UploadFile();
        String urlImage = await uploadFile.call(image);

          if (urlImage.isNotEmpty) {
            UserConst.imageList.add(urlImage);
            onImageSuccessfullySaved(uploadFile.downloadUrl);
          } else {
            throw "Failed to save image";
          }     
    } catch (e) {
      throw ("Erro no request");
    }
  }
}
  
