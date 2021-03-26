
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_const.dart';


Future<HttpResponse> doPost(String url) async {
  String apiKey = ApiConsts.apiKey;
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient();
  //BaseClient ioClient = new BaseClient(httpClient);
}