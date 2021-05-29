class Image{
  int id;
  String base64Photo;
  DateTime data;

  Image({
    this.id,
    this.base64Photo,
    this.data,
  });

  Image.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    base64Photo = json['base64Photo'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['base64Photo'] = this.base64Photo;
    data['data'] = this.data;
    return data;
  }
}