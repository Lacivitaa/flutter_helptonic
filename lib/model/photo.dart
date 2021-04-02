class Photo {
  String sId;
  String data;
  String imageUrl;
  String message;
  bool error;

  Photo({this.sId, this.data, this.imageUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    data = json['data'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['data'] = this.data;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
