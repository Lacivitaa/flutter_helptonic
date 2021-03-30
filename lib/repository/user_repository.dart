import 'package:dio/dio.dart';
import 'package:flutter_ftt/interface/api_sheet_repository_interface.dart';
import 'package:flutter_ftt/model/api_responde.dart';
import 'package:flutter_ftt/model/client.dart';
import 'package:flutter_ftt/repository/api_const.dart';

class UserRepository implements IApiSheetInterface{
  Dio dio = Dio();
  bool isLoading;

  @override
  Future<ApiResponse<User>> fetchData() async {
    try {
      isLoading = true;
      Response response = await dio.get(Api.apiUrl);
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
}