import 'package:flutter_ftt/model/api_response.dart';
import 'package:flutter_ftt/model/photo.dart';
import 'package:flutter_ftt/model/user.dart';

abstract class IApiSheetInterfacePhoto{
    Future<ApiResponse<User>> postPhoto(Photo userData);
    Future<ApiResponse<User>> deletePhoto(Photo userData);
}