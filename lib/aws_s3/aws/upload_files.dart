import 'package:dio/dio.dart';
import 'package:flutter_ftt/constant/api_const.dart';
import 'package:flutter_ftt/repository/photo_repository.dart';
import 'package:image_picker/image_picker.dart';

class UploadFile {
  bool success;
  String message;
  Dio dio = Dio();
  String downloadUrl;

  bool isUploaded;

  Future<bool> call(PickedFile image) async {
    try {
      FormData formData = new FormData.fromMap(
        {
          "file" : await MultipartFile.fromFile(image.path),
        }
      );
      Response response = await dio.post(Api.apiPython, data: formData);


      if (response.statusCode != 200){
        throw ('Erro no request');
      }
      downloadUrl = response.toString();
      
      
      PhotoRepository repository = new PhotoRepository();
      if(!await repository.postPhoto(downloadUrl)){
          throw ('Erro ao salvar da foto');
      }
      /* Uint8List bytes = await image.readAsBytes();
      var response = await http.put(url, body: bytes);
      if (response.statusCode == 200) {
        isUploaded = true;
      } */
      return true;
    } catch (e) {
      throw ('Erro no request');
    }
  }
}