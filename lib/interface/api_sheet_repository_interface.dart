import 'package:flutter_ftt/model/api_responde.dart';
import 'package:flutter_ftt/model/client.dart';

abstract class IApiSheetInterface {
  Future<ApiResponse<User>> fetchData();
}