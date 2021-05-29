import 'package:flutter_ftt/model/api_response.dart';
import 'package:flutter_ftt/model/login.dart';
import 'package:flutter_ftt/model/user.dart';

abstract class IApiSheetInterface {
  Future<ApiResponse<User>> fetchData(Login userData);
}