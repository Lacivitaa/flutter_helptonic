import 'package:dio/dio.dart';
import 'package:flutter_ftt/interface/api_sheet_repository_interface.dart';
import 'package:flutter_ftt/model/api_response.dart';
import 'package:flutter_ftt/model/login.dart';
import 'package:flutter_ftt/model/user.dart';
import 'package:flutter_ftt/repository/api_const.dart';

class UserRepository implements IApiSheetInterface{
  Dio dio = Dio();
  bool isLoading;
  static String uri = "/login";

  @override
  Future<ApiResponse<User>> fetchData(Login userData) async {
    try {
      isLoading = true;
      Response response = await dio.post(Api.apiUrl+uri, data: {'email': userData.email, 'password': userData.senha});
      var responseData = User.fromJson(response.data);
      isLoading = false;
      return ApiResponse(
        message: response.statusMessage,
        status: response.statusCode);
        //data: responseData);
    } catch (e){
      isLoading = false;
      return ApiResponse(message: e, status: 500);
    }
  }
}