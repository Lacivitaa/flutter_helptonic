import 'package:dio/dio.dart';
import 'package:flutter_ftt/interface/login_repository_interface.dart';
import 'package:flutter_ftt/model/login.dart';
import 'package:flutter_ftt/model/user.dart';
import 'package:flutter_ftt/repository/api_const.dart';
import 'package:flutter_ftt/repository/user_const.dart';

class UserRepository implements IApiSheetInterfaceLogin {
  Dio dio = Dio();
  static String uri = "/login";

  @override
  Future<User> loginUser(Login userData) async {
    try {
      Response response = await dio.post(Api.apiUrl + uri,
          data: {'email': userData.email, 'password': userData.senha});
      var responseData = User.fromJson(response.data);

      if (response.statusCode == 200) {
        UserConst.id = responseData.id;
        UserConst.email = responseData.email;
        UserConst.name = responseData.name;
        UserConst.typeBlindess = responseData.typeColorBlindess;
        UserConst.token = responseData.token;
      }

      return responseData;
    } on DioError catch (e) {
      return User.fromJson(e.response.data);
    }
  }
}
