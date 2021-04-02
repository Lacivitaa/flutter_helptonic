import 'package:flutter_ftt/model/login.dart';
import 'package:flutter_ftt/model/user.dart';

abstract class IApiSheetInterfaceLogin {
  Future<User> loginUser(Login userData);
}
