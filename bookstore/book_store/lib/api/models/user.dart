// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User? userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User? data) => json.encode(data!.toJson());

class User {
  User({
    this.expiry,
    this.token,
  });

  DateTime? expiry;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        expiry: DateTime.parse(json["expiry"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "expiry": expiry?.toIso8601String(),
        "token": token,
      };
}
