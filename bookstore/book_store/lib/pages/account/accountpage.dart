import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book_store/api/models/profile.dart';
import 'package:book_store/main.dart';
import 'package:book_store/pages/aboutus.dart';

import 'package:book_store/pages/address/addressscreen.dart';
import 'package:book_store/pages/orderpage/orderpage.dart';
import 'package:book_store/pages/terms&conditions.dart';
import 'package:restart_app/restart_app.dart';
import 'package:book_store/pages/account/controller/profilecontroller.dart';
import 'package:book_store/pages/loginpage/loginpage.dart';
import 'package:book_store/pages/mainpage.dart';
import 'package:book_store/pages/mainpage/homepage.dart';
import 'package:book_store/repository_impl/local_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Accountscreen extends StatefulWidget {
  final User? user;

  Accountscreen({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<Accountscreen> createState() => _AccountscreenState();
}

class _AccountscreenState extends State<Accountscreen> {
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());
  // String? id;

  // String? email;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    profilecontroller.profilelist.value;
  }

  @override
  Widget build(BuildContext context) {
    print("email is  ");
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Lottie.asset(
                        'assets/images/112000-account-profile-animation.json'),
                  ),
                ),
                const SizedBox(width: 4),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Obx(() {
                    //     if (widget.profilecontroller.profile!.email == null) {
                    //       return Text(
                    //         widget.profilecontroller.profile!.email.toString(),
                    //         //"Sign in your account",
                    //         style: const TextStyle(
                    //             fontSize: 20, fontWeight: FontWeight.w500),
                    //       );
                    //     } else {
                    //       return Text(
                    //         "Sign in your account",
                    //         style: const TextStyle(
                    //             fontSize: 20, fontWeight: FontWeight.w500),
                    //       );
                    //     }
                    //   }),
                    //)
                    // if (widget.profilecontroller.profile == null)
                    //   Text("Sign in to your account")
                    // else
                    //   Text(widget.profilecontroller.profile!.email.toString()),
                    Obx((() => Text(
                          profilecontroller.profilelist.value!.username ??
                              "sign in to your account",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ))),
                  ],
                )
              ],
              //
            ),
            SizedBox(
              height: 20,
            ),

            // buildAccountCard(title: "Notification", onClick: () {}),
            buildAccountCard(
                title: "Add Address",
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addressscreen()));
                }),
            buildAccountCard(
                title: "Your Orders",
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Orderpage()));
                }),
            buildAccountCard(
                title: "About Us",
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Aboutus()));
                }),

            buildAccountCard(
                title: "Terms of Service",
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsAndConditionsPage()));
                }),
            Obx(() => buildAccountCard(
                title: profilecontroller.profilelist.value!.username == null
                    ? "Sign In or Register"
                    : "Sign Out",
                onClick: () async {
                  if (profilecontroller.profilelist.value!.username != null) {
                    profilecontroller.logout();
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                    Restart.restartApp();
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                }))
            // buildAccountCard(
            //     title: "Signin or Signup",
            //     onClick: () {
            //       Get.off(LoginPage());
            //     }),
            // buildAccountCard(
            //     title: "Logout",
            //     onClick: () async {
            //       profilecontroller.logout();
            //       SharedPreferences preferences =
            //           await SharedPreferences.getInstance();
            //       await preferences.clear();
            //       Restart.restartApp();
            //       Get.reload(tag: "Reload successfully");
            //       // final SharedPreferences pref = await _pref;
            //       // pref.clear();
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) => Accountscreen()));
            //     }),

            // Obx(() => buildAccountCard(
            //     title: "abc",
            //     onClick: () {
            //       // if(authController.user.value!=null){
            //       //   authController.signOut();
            //       // } else {
            //       //   Navigator.push(
            //       //       context,
            //       //       MaterialPageRoute(
            //       //           builder: (context) => const SignInScreen()));
            //       // }
            //     }))
          ],
        ));
  }
}

Widget buildAccountCard({required String title, required Function() onClick}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 14),
    child: GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.1,
              blurRadius: 7,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Icon(Icons.keyboard_arrow_right_outlined),
          ],
        ),
      ),
    ),
  );
}

// class Profilecontroller extends GetxController {
//   Future<SharedPreferences> _pref = SharedPreferences.getInstance();
//   Profile? profile;

//   // var profile = <Profile>[].obs;
//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//     getprofile();
//   }

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
// }
