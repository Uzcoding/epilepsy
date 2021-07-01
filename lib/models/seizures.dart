class SeizuresApi {
  List<Seizures> data;
  Links links;
  Meta meta;

  SeizuresApi({this.data, this.links, this.meta});

  SeizuresApi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Seizures>();
      json['data'].forEach((v) {
        data.add(new Seizures.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Seizures {
  int id;
  String date;
  String duration;
  String type;
  String reason;
  String activity;
  String place;
  String notice;

  Seizures(
      {this.id,
      this.date,
      this.duration,
      this.type,
      this.reason,
      this.activity,
      this.place,
      this.notice});

  Seizures.fromJson(Map<String, dynamic> json) {
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

class Links {
  String first;
  String last;
  Null prev;
  Null next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
