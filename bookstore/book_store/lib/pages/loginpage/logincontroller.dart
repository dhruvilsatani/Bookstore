import 'dart:convert';
import 'package:restart_app/restart_app.dart';
import 'package:book_store/pages/account/accountpage.dart';
import 'package:book_store/pages/account/controller/profilecontroller.dart';
import 'package:book_store/pages/loginpage/endpints.dart';
import 'package:book_store/pages/loginpage/loginpage.dart';
import 'package:book_store/pages/mainpage.dart';
import 'package:book_store/pages/mainpage/homepage.dart';
// import 'package:book_store/repository/api_repository.dart';
// import 'package:book_store/repository/local_repository.dart';
import 'package:book_store/request/login_request.dart';
import 'package:book_store/request/register_request.dart';
import 'package:book_store/respons/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  Profilecontroller profilecontroller = Get.put(Profilecontroller());
  TextEditingController username = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  loginWithEmail() async {
    print("called1");

    try {
      print("called2");
      var result = await http.Client().post(
          Uri.parse("https://dhruvilsatani.pythonanywhere.com/data/login/"),
          body: {
            'username': username.text.trim(),
            'password': passwordController.text
          });
      print("called ");
      if (result.statusCode == 200) {
        print("called3");
        var jsonData = jsonDecode(result.body);
        print('login');
        print(jsonData["token"]);
        final SharedPreferences pref = await _prefs;
        pref.clear();
        pref.setString("token", jsonData["token"]);
        Restart.restartApp();
        Profilecontroller();
        // Get.off(Mainpage());
        Fluttertoast.showToast(
            msg: 'Login successfully',
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.black);
        // profilecontroller.getprofile();

        return loginResponseFromJson(jsonData);
      } else {
        print("username incorrect");
        return Fluttertoast.showToast(
            msg: 'Username or password in correct',
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.black);
      }
      // var url = Uri.parse(
      //     ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      // var body = {
      //   'username': username.text.trim(),
      //   'password': passwordController.text
      // };
      // http.Response response = await http.post(url, body: body);
      //   print("called2");
      //   if (response.statusCode == 200) {
      //     print("called");
      //     final json = jsonDecode(response.body);
      //     if (json['code'] == 0) {
      //       var token = json['token'];
      //       print(token);
      //       final SharedPreferences? prefs = await _prefs;
      //       await prefs?.setString('token', token);

      //       username.clear();
      //       passwordController.clear();
      //       Get.off(homepage());
      //     } else if (json['code'] == 1) {
      //       throw jsonDecode(response.body)['message'];
      //     }
      //   } else {
      //     throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      //   }
    } catch (error) {
      print(error);
      // Get.back();
      // showDialog(
      //     context: Get.context!,
      //     builder: (context) {
      //       return SimpleDialog(
      //         title: Text('Error'),
      //         contentPadding: EdgeInsets.all(20),
      //         children: [Text(error.toString())],
      //       );
      //     });
    }
  }
}

class RegisterationController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      print("called2");
      var result = await http.Client().post(
          Uri.parse("https://dhruvilsatani.pythonanywhere.com/data/register/"),
          body: {
            'username': usernameController.text.trim(),
            "email": emailController.text,
            'password': passwordController.text
          });
      print("called ");
      if (result.statusCode == 200) {
        print("called3");
        var jsonData = jsonDecode(result.body);
        print('login');
        print(jsonData);
        print(jsonData["token"]);
        print(jsonData["user "]["username"]);
        print(jsonData["user "]["id"]);
        final SharedPreferences pref = await _prefs;
        pref.clear();

        Get.off(LoginPage());
        Fluttertoast.showToast(
            msg: 'register successfully',
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.black);
        return jsonData;
      } else {
        print("login nathi thayu");
        return null;
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
// enum SignType { sigIn, signUp }

// class LoginController extends GetxController {
//   final LocalRepositoryInterface localRepositoryInterface;
//   final ApiRepositoryInterface apiRepositoryInterface;

//   LoginController(
//       {required this.localRepositoryInterface,
//       required this.apiRepositoryInterface});
//   // LocalRepositoryInterface localRepositoryInterface = Get.find();
//   // ApiRepositoryInterface apiRepositoryInterface = Get.find();
//   final passwordTextController = TextEditingController();
//   final usernameTexcontroller = TextEditingController();
//   final emailTextController = TextEditingController();

//   var isLoading = false.obs;

//   var isvalidEmail = false.obs;
//   var isValidPassword = false.obs;
//   RxBool isSignIn = true.obs;
//   RxBool showPassword = true.obs;

//   toggleFormType() {
//     isSignIn(!isSignIn.value);
//   }

//   toggleShowPassword() {
//     showPassword(!showPassword.value);
//   }

//   Future<bool> login() async {
//     final username = usernameTexcontroller.text;
//     final password = passwordTextController.text;

//     try {
//       isLoading(true);
//       final loginResponse =
//           await apiRepositoryInterface.login(LoginRequest(username, password));

//       if (loginResponse != null) {
//         await localRepositoryInterface.saveToken(loginResponse.token);

//         return true;
//       } else {
//         isLoading(false);

//         return false;
//       }
//     } on Exception {
//       isLoading(false);
//       return false;
//     }
//   }

//   Future<bool> register() async {
//     final username = usernameTexcontroller.text;
//     final email = emailTextController.text;
//     final password = passwordTextController.text;

//     try {
//       isLoading(true);
//       final loginResponse = await apiRepositoryInterface
//           .register(RegisterRequest(username, email, password));
//       if (loginResponse != null) {
//         {
//           print(loginResponse);
//           return true;
//         }
//       } else {
//         isLoading(false);

//         return false;
//       }
//     } on Exception catch (_) {
//       isLoading(false);
//       return false;
//     }
//   }
//}

 






























































// import 'dart:html';

// import 'package:book_store/repository/api_repository.dart';
// import 'package:book_store/repository/local_repository.dart';
// import 'package:book_store/repository_impl/api_repository_impl.dart';
// import 'package:book_store/repository_impl/local_repository_impl.dart';
// import 'package:book_store/request/login_request.dart';
// import 'package:book_store/request/register_request.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// enum SignType { sigIn, signUp }

// class Logincontroller extends GetxController {
//   ApiRepositoryInterface apiRepositoryInterface = Get.find();
//   LocalRepositoryInterface localRepositoryInterface = Get.find();
//   var isLoading = false.obs;

//   var isvalidEmail = false.obs;
//   var isValidPassword = false.obs;
//   RxBool isSignIn = true.obs;
//   RxBool showPassword = true.obs;

//   toggleFormType() {
//     isSignIn(!isSignIn.value);
//   }

//   toggleShowPassword() {
//     showPassword(!showPassword.value);
//   }

//   final passwordeditingontroller = TextEditingController();

//   final emaileditingcontroller = TextEditingController();
//   final usernameeditingontroller = TextEditingController();

//   Future<bool> login() async {
//     final username = usernameeditingontroller.text;
//     final password = passwordeditingontroller.text;
    
//     try {
//       isLoading(true);
//       final loginreponse =
//           await apiRepositoryInterface.login(LoginRequest(username, password));
//       if (loginreponse != null) {
//         await localRepositoryInterface.saveToken(loginreponse.token);
//         return true;
//       } else {
//         isLoading(false);
//         return false;
//       }
//     } on Exception {
//       isLoading(false);
//       return false;
//     }
//   }

//   Future<bool> register() async {
//     final username = usernameeditingontroller.text;
//     final email = emaileditingcontroller.text;
//     final password = passwordeditingontroller.text;

//     try {
//       isLoading(true);
//       final loginResponse = await apiRepositoryInterface
//           .register(RegisterRequest(username, email, password));
//       if (loginResponse != null) {
//         await localRepositoryInterface.saveToken(loginResponse.token);

//         return true;
//       } else {
//         isLoading(false);
//         return false;
//       }

//       // ignore: nullable_type_in_catch_clause
//     } on Exception catch (_) {
//       isLoading(false);
//       return false;
//     }
//   }
// }
