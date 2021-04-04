import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ftt/interface/login_repository_interface.dart';
import 'package:flutter_ftt/model/login.dart';
import 'package:flutter_ftt/model/user.dart';
import 'package:flutter_ftt/constant/api_const.dart';
import 'package:flutter_ftt/constant/user_const.dart';
import 'package:flutter_ftt/view/widget/single_child.dart';

BuildContext context;

class LoginRepository implements IApiSheetInterfaceLogin {
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
        for (int i = 0; i < responseData.photo.length; i++) {
          imageList.add(responseData.photo[i].imageUrl);
        }
        
      }

      return responseData;
    } on DioError catch (e) {
      return User.fromJson(e.response.data);
    }
  }
}
