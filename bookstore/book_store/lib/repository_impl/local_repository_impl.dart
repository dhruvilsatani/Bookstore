import 'package:book_store/api/models/profile.dart';
//import 'package:book_store/repository/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'token';
const _pref_username = 'username';
const _pref_id = 'id';
const _pref_email = 'email';

class Local_repository_impl {
//   @override
//   Future<void> clearAllData() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.clear();
//   }

  @override
  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  static Future<int?> getid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(_pref_id);
  }

  @override
  static Future<String?> getusername() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_username);
  }

  @override
  static Future<String?> getemail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_email);
  }

  // @override
  // static Future<User> getUser() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   final username = sharedPreferences.getString(_pref_username);
  //   final id = sharedPreferences.getString(_pref_id) as int;
  //   final email = sharedPreferences.getString(_pref_username);
  //   final user = User(username: username, id: id, email: email);
  //   return user;
  // }

  // @override
  // static Future<User?> saveUser(User? user) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString(_pref_username, user!.username!);
  //   sharedPreferences.setString(_pref_id, user.id as String);
  //   sharedPreferences.setString(_pref_email, user.email as String);
  // }
  @override
  static Future<void> saveId(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(_pref_id, id!);
  }

  @override
  static Future<void> saveUsername(String? username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_username, username!);
  }

  @override
  static Future<void> saveEmail(String? email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_email, email!);
  }

  @override
  static Future<void> saveToken(String? token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token!);
  }
}
