/// _id : "652a16353c0fd4270000cd94"
/// Username : "zhr"
/// email : "zhr@gmail.com"
/// Password : "1234"
/// Profile : ""

class UserModel {
  UserModel({
      this.id, 
      this.username, 
      this.email, 
      this.password, 
      this.profile,});

  UserModel.fromJson(dynamic json) {
    id = json['_id'];
    username = json['Username'];
    email = json['email'];
    password = json['Password'];
    profile = json['Profile'];
  }
  String? id;
  String? username;
  String? email;
  String? password;
  String? profile;
UserModel copyWith({  String? id,
  String? username,
  String? email,
  String? password,
  String? profile,
}) => UserModel(  id: id ?? this.id,
  username: username ?? this.username,
  email: email ?? this.email,
  password: password ?? this.password,
  profile: profile ?? this.profile,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['Username'] = username;
    map['email'] = email;
    map['Password'] = password;
    map['Profile'] = profile;
    return map;
  }

}