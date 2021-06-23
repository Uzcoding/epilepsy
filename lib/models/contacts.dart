class Contacts {
  String supportLink;

  Contacts({this.supportLink});

  Contacts.fromJson(Map<String, dynamic> json) {
    supportLink = json['support_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['support_link'] = this.supportLink;
    return data;
  }
}
