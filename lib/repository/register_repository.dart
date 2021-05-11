import 'package:dio/dio.dart';
import 'package:flutter_ftt/interface/register_repository_interface.dart';
import 'package:flutter_ftt/model/register.dart';
import 'package:flutter_ftt/model/user.dart';
import 'package:flutter_ftt/constant/api_const.dart';
import 'package:flutter_ftt/constant/user_const.dart';

class RegisterRepository implements IApiSheetInterfaceRegister {
  Dio dio = Dio();
  static String uri = "/user";

  @override
  Future<User> registerUser(Register userData) async {
    try {
      Response response = await dio.post(Api.apiUrl + uri, data: {
        'email': userData.email.trim(),
        'password': userData.senha.trim(),
        'name': userData.nome.trim(),
        'typeColorBlindess': userData.tipoDalt.trim()
      });
      var responseData = User.fromJson(response.data);

      UserConst.id = responseData.id;
      UserConst.email = responseData.email;
      UserConst.name = responseData.name;
      UserConst.typeBlindess = responseData.typeColorBlindess;
      UserConst.token = responseData.token;

      return responseData;
    } on DioError catch (e) {
      return User.fromJson(e.response.data);
    }
  }
}
