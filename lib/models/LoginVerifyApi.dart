import 'package:epilepsy/models/user_verify.dart';

class LoginVerifyApi {
  UserVerify data;

  LoginVerifyApi({this.data});

  LoginVerifyApi.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserVerify.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
