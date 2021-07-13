class MiniLast {
  int id;
  String date;
  String duration;
  String type;
  String reason;
  String activity;
  String place;
  String notice;

  MiniLast(
      {this.id,
      this.date,
      this.duration,
      this.type,
      this.reason,
      this.activity,
      this.place,
      this.notice});

  MiniLast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    duration = json['duration'];
    type = json['type'];
    reason = json['reason'];
    activity = json['activity'];
    place = json['place'];
    notice = json['notice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['duration'] = this.duration;
    data['type'] = this.type;
    data['reason'] = this.reason;
    data['activity'] = this.activity;
    data['place'] = this.place;
    data['notice'] = this.notice;
    return data;
  }
}
