import 'package:flutter_ftt/model/photo.dart';

class User {
  String id;
  String email;
  String password;
  String name;
  String typeColorBlindess;
  List<Photo> photo;
  int iV;
  String token;
  String message;
  bool error;

  User(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.typeColorBlindess,
      this.photo,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    typeColorBlindess = json['typeColorBlindess'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo.add(new Photo.fromJson(v));
      });
    }
    iV = json['__v'];
    token = json['token'];
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['typeColorBlindess'] = this.typeColorBlindess;
    if (this.photo != null) {
      data['photo'] = this.photo.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['token'] = this.token;
    data['message'] = this.message;
    data['error']= this.error;
    return data;
  }
}
