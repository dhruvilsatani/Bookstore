class User {
  User({
    this.id,
    this.username,
    this.email,
  });
  final int? id;

  final String? username;
  final String? email;

  factory User.empty() => User(
        id: null,
        username: '',
        email: '',
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );
}
