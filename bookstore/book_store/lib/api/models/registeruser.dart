import 'dart:convert';

Registeruser registeruserFromJson(String str) =>
    Registeruser.fromJson(json.decode(str));

String registeruserToJson(Registeruser data) => json.encode(data.toJson());

class Registeruser {
  Registeruser({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Registeruser.fromJson(Map<String, dynamic> json) => Registeruser(
        user: User.fromJson(json["user "]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user ": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
  });

  int id;
  String username;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
      };
}
