import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  const LoginResponse({this.token});
  final String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["Token"],
      );
}
