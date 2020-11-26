class User {
  String id;
  String username;
  String nick;
  String headurl;
  String decs;
  String gender;
  String followCount;
  String fanCount;
  int ismember;

  int isvertify;

  String token;
  List<String> auth;

  User(
      {this.id,
      this.username,
      this.nick,
      this.headurl,
      this.decs,
      this.gender,
      this.followCount,
      this.fanCount,
      this.ismember,
      this.isvertify,
      this.token,
      this.auth});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nick = json['nick'];
    headurl = json['headurl'];
    decs = json['decs'];
    gender = json['gender'];
    followCount = json['followCount'];
    fanCount = json['fanCount'];
    ismember = json['ismember'];
    isvertify = json['isvertify'];
    token = json['token'];
    auth = json['auth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['nick'] = this.nick;
    data['headurl'] = this.headurl;
    data['decs'] = this.decs;
    data['gender'] = this.gender;
    data['followCount'] = this.followCount;
    data['fanCount'] = this.fanCount;
    data['ismember'] = this.ismember;
    data['isvertify'] = this.isvertify;
    data['token'] = this.token;
    data['auth'] = this.auth;

    return data;
  }
}
