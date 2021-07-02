class DrugList {
  int id;
  String title;
  String dosage;
  String dateStart;
  String dateEnd;
  String image;
  String comment;

  DrugList(
      {this.id,
      this.title,
      this.dosage,
      this.dateStart,
      this.dateEnd,
      this.image,
      this.comment});

  DrugList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dosage = json['dosage'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    image = json['image'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['dosage'] = this.dosage;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['image'] = this.image;
    data['comment'] = this.comment;
    return data;
  }
}
