import 'package:dio/dio.dart';
import 'package:flutter_ftt/interface/photo_repository_interface.dart';
import 'package:flutter_ftt/model/api_response.dart';
import 'package:flutter_ftt/model/photo.dart';
import 'package:flutter_ftt/model/user.dart';
import 'package:flutter_ftt/repository/user_const.dart';

class PhotoRepository implements IApiSheetInterfacePhoto{
  Dio dio = Dio();
  bool isLoading;
  static String uri = "/user";

  @override
  Future<ApiResponse<User>> postPhoto(Photo userData) async {
    try {
      isLoading = true;
      Response response;
      var responseData = User.fromJson(response.data);
      isLoading = false;

      return ApiResponse(
        message: response.statusMessage,
        status: response.statusCode,
        data: responseData);
    } catch (e){
      isLoading = false;
      return ApiResponse(message: e, status: 500);
    }
  }

  @override
  Future<ApiResponse<User>> deletePhoto(Photo userData) {
  }
  
}