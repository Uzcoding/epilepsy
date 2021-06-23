import 'package:epilepsy/models/profile.dart';

class ProfileApi {
  ProfileData data;

  ProfileApi({this.data});

  ProfileApi.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ProfileData {
  int id;
  String phone;
  Profile profile;
  String createdAt;

  ProfileData({this.id, this.phone, this.profile, this.createdAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}
