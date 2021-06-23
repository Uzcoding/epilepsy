class UserVerify {
  int id;
  int userId;
  String token;
  String deviceInfo;
  String loggedAt;
  String lastSeenAt;

  UserVerify(
      {this.id,
      this.userId,
      this.token,
      this.deviceInfo,
      this.loggedAt,
      this.lastSeenAt});

  UserVerify.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    token = json['token'];
    deviceInfo = json['device_info'];
    loggedAt = json['logged_at'];
    lastSeenAt = json['last_seen_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['token'] = this.token;
    data['device_info'] = this.deviceInfo;
    data['logged_at'] = this.loggedAt;
    data['last_seen_at'] = this.lastSeenAt;
    return data;
  }
}
