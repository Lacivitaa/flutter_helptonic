class Image{
  int idUser;
  String bynaryPhoto;
  DateTime data;

  Image({
    this.idUser,
    this.bynaryPhoto,
    this.data,
  });

  Image.fromJson(Map<String, dynamic> json){
    idUser = json['idUser'];
    bynaryPhoto = json['bynaryPhoto'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['bynaryPhoto'] = this.bynaryPhoto;
    data['data'] = this.data;
    return data;
  }
}