class User {
  String sId;
  String email;
  String password;
  String name;
  String typeColorBlindess;
  List<Photo> photo;
  int iV;

  User(
      {this.sId,
      this.email,
      this.password,
      this.name,
      this.typeColorBlindess,
      this.photo,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['typeColorBlindess'] = this.typeColorBlindess;
    if (this.photo != null) {
      data['photo'] = this.photo.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Photo {
  String sId;
  String data;
  String base64Photo;

  Photo({this.sId, this.data, this.base64Photo});

  Photo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    data = json['data'];
    base64Photo = json['base64Photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['data'] = this.data;
    data['base64Photo'] = this.base64Photo;
    return data;
  }
}