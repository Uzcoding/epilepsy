import 'package:epilepsy/models/mini_last_three.dart';

class LastThree {
  List<MiniLast> data;

  LastThree({this.data});

  LastThree.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MiniLast>[];
      json['data'].forEach((v) {
        data.add(new MiniLast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
