
import 'package:flutter_ftt/model/register.dart';
import 'package:flutter_ftt/model/user.dart';

abstract class IApiSheetInterfaceRegister {
    Future<User> registerUser(Register userData);
}