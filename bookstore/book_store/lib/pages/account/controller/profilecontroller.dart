import 'dart:convert';

import 'package:book_store/api/models/profile.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:book_store/pages/mainpage.dart';
import 'package:book_store/repository_impl/api_repository_impl.dart';
import 'package:book_store/repository_impl/local_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart ' as http;
import 'package:hive/hive.dart';

class Profilecontroller extends GetxController {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  //Profile? profile;
  //var profilelist = <User?>[].obs;
  Rx<User?> profilelist = User().obs;
  // var user = User.empty().obs;
  User? user;
  // var profile = <Profile>[].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getprofile();
  }

  void getprofile() async {
    final token = await Local_repository_impl.getToken();
    print(token);
    try {
      var response = await Apirepositoryimpl.getprofile(token);
      if (response != null) {
        print("profile fatched");
        profilelist(response);
        print(response.email);
        await Local_repository_impl.saveId(response.id);
        await Local_repository_impl.saveEmail(response.email);
        await Local_repository_impl.saveUsername(response.username);
        var id = await Local_repository_impl.getid();
        print(id);
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    final token = await Local_repository_impl.getToken();
    try {
      var response = await Apirepositoryimpl.logouts(token);
      if (response == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();

        getprofile();
        Get.deleteAll();
        Get.off(() => Mainpage());
      }
    } catch (e) {
      print(e);
    }
  }

  // loaduser() {
  //   Local_repository_impl.getUser().then((value) => user(value));
  // }

//   getprofile() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     // final SharedPreferences prefs = await prefs;
//       String token = prefs.get("token").toString();
//       print("called67");
//       print(token);
//       var response = await http.Client().get(
//           Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/profile/'),
//           headers: {'Authorization': 'token $token'});

//       if (response.statusCode == 200) {
//         print("profile called");
//         var jsonData = jsonDecode(response.body.toString());
//         //List list = (jsonDecode(jsonData) as List<dynamic>);
//         print(jsonData);
//         print(jsonData["email"]);
//         print(jsonData);
//         print('Fetch profile called');

//         profile = Profile.fromJson(jsonData);
//         print(profile!.email);
//         final SharedPreferences prefs = await _pref;
//         prefs.setString('username', profile!.username.toString());

//         print(profile!.email.toString());
//       } else {
//         print("data fetch nathi thaya");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}
//   // ignore: prefer_typing_uninitialized_variables

//   // Profile? profile;
//   var profilelist = <Profile>[].obs;
//   // var profilever = Future<String>;

//   RxString profilever = ''.obs;
//   String profileid = "";
//   // ignore: prefer_typing_uninitialized_variables
//   var profilename;
//   late String profilemail;

//   //RxString profilestring = Profile.fromJson;
//   //Rxn<Profile?> profilelist = Rxn<Profile?>();
//   // Rxn<Profile> profile = Rxn<Profile>();
//   // final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//   static gettoken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     // final SharedPreferences prefs = await prefs;
//     String token = prefs.get("token").toString();

//     return token;
//   }

//   // String token = gettoken().toString();

//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//     gettoken();
//     fetchprofile();
//   }

//   Future<void> fetchprofile() async {
//     print(gettoken());
//     print("call thayu che98");
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     // final SharedPreferences prefs = await prefs;
//     String token = prefs.get("token").toString();
//     print("called");
//     print(token);
//     try {
//       print("calledthayu che ");
//       //print(gettoken().toString());
//       print(token);
//       var profile = await Apirepositoryimpl.getprofile(token);
//       if (profile != null) {
//         print("123");
//         print("mali gayu");
//         //print(profile1["id"]);

//         profilelist.value = profile as List<Profile>;

//         // print(profile["email"]);
//         // print("profile list");
//         // print(profilelist);

//         // print(user);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

