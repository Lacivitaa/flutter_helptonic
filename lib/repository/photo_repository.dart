import 'package:dio/dio.dart';
import 'package:flutter_ftt/interface/photo_repository_interface.dart';
import 'package:flutter_ftt/model/photo.dart';
import 'package:flutter_ftt/constant/user_const.dart';

import '../constant/api_const.dart';

class PhotoRepository implements IApiSheetInterfacePhoto {
  Dio dio = Dio();
  static String uri = "/photo";

  @override
  Future<bool> postPhoto(String urlImage) async {
    try {
      Response response = await dio.post(Api.apiUrl + uri,
          data: {
            'userId': UserConst.id,
            'photo': {'imageUrl': urlImage}
          },
          options: Options(headers: {
            'x-access-token': UserConst.token,
            'Content-Type': 'application/json'
          }));
      bool responseData = response.data;

      return responseData;
    } on DioError catch (e) {
      return false;
    }
    }

  @override
  Future<bool> deletePhoto(Photo userData) {
    throw UnimplementedError();
  }
}

class ApiConst {}
