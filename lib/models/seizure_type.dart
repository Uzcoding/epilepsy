import 'package:epilepsy/models/seizure_model.dart';

class SeizureTypeModel {
  List<SeizureModel> seizureTypeModel;

  SeizureTypeModel({this.seizureTypeModel});

  SeizureTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      seizureTypeModel = <SeizureModel>[];
      json['data'].forEach((v) {
        seizureTypeModel.add(new SeizureModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seizureTypeModel != null) {
      data['data'] = this.seizureTypeModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Data {
//   int id;
//   String title;

//   Data({this.id, this.title});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     return data;
//   }
// }
