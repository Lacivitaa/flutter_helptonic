import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ftt/constant/api_const.dart';
import 'package:flutter_ftt/constant/user_const.dart';
import 'package:flutter_ftt/model/photo.dart';
import 'package:flutter_ftt/repository/photo_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;

class UploadFile {
  bool success;
  String message;
  Dio dio = Dio();
  String downloadUrl;

  bool isUploaded;

  Future<String> call(PickedFile image) async {
    try {

      //Converter a imagem em Base64 
      final bytes = await Io.File(image.path).readAsBytes();
      String img64 = base64Encode(bytes);

      //Enviar imagem e token pro python
      Response response = await dio.post(Api.apiPython, data:{
        'token': UserConst.token,
        'image': img64 });

        if (response.statusCode != 200){
        throw ('Erro no request');
      }
      downloadUrl = response.toString();

      //Enviar Url da imagem pro node
      PhotoRepository repository = new PhotoRepository();
      if(!await repository.postPhoto(downloadUrl)){
          throw ('Erro ao salvar da foto');
      }

     return downloadUrl;
      /* Uint8List bytes = await image.readAsBytes();
      var response = await http.put(url, body: bytes);
      if (response.statusCode == 200) {
        isUploaded = true;
      } */
    } catch (e) {
      throw ('Erro no request');
    }
  }
}