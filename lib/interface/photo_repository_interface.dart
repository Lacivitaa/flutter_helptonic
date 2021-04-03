import 'package:flutter_ftt/model/photo.dart';


abstract class IApiSheetInterfacePhoto{
    Future<bool> postPhoto(String urlImage);
    Future<bool> deletePhoto(Photo userData);
}