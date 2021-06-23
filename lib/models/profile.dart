class Profile {
  String name;
  String avatar;
  String birthday;
  String gender;

  Profile({this.name, this.avatar, this.birthday, this.gender});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    birthday = json['birthday'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    return data;
  }
}
