class EEGModel {
  int id;
  String date;
  String image;
  String comment;

  EEGModel({this.id, this.date, this.image, this.comment});

  EEGModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    image = json['image'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['image'] = this.image;
    data['comment'] = this.comment;
    return data;
  }
}
