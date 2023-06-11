import 'package:book_store/pages/loginpage/logincontroller.dart';
import 'package:book_store/pages/loginpage/register.dart';
import 'package:book_store/pages/mainpage.dart';
import 'package:book_store/pages/mainpage/homepage.dart';
import 'package:book_store/pages/mainpage/topbar.dart';
import 'package:restart_app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());
  RegisterationController registerationController =
      Get.put(RegisterationController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => Mainpage())));
          },
          color: Colors.black,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            // margin:
            // EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    LottieBuilder.asset(
                      'assets/images/77792-book.json',
                      height: 220,
                    ),
                    // SizedBox(height: 30),
                    // Icon(
                    //   Icons.shopping_bag_rounded,
                    //   color: Colors.blueAccent,
                    //   size: 80,
                    // ),
                    // Text(
                    //   'Book Store',
                    //   style: TextStyle(
                    //     color: Colors.blueAccent,
                    //     fontSize: 20,
                    //     letterSpacing: 4.0,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    // ),
                  ],
                ),
                //SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Login Here',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: loginController.username,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.supervised_user_circle_outlined,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Your Username',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: loginController.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Your Password',
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.blueAccent,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 6 || value.length > 20) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginController.loginWithEmail();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      // FlatButton(
                      //   onPressed: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       return "abc";
                      //       // Get.offAll("");
                      //     }
                      //   },
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.blueAccent,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     height: MediaQuery.of(context).size.height * 0.06,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Center(
                      //       child: Text(
                      //         'Login',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an Account ?'),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(Registerpage());
                            },
                            child: Text(
                              'Register Here',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:book_store/pages/loginpage/loginbinding.dart';
// import 'package:book_store/pages/loginpage/logincontroller.dart';
// import 'package:book_store/pages/loginpage/loginfrom.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   // RegisterationController registerationController =
//   //     Get.put(RegisterationController());
//   // LoginBinding loginBinding=Get.put(loca)
//   // LoginController loginController = Get.find();
//   // LoginBinding loginBinding = Get.put(LoginBinding());
//   LoginController loginController = Get.put(LoginController());
//   RegisterationController registerationController =
//       Get.put(RegisterationController());
//   var isLogin = true.obs;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         // ignore: prefer_const_constructors
//         decoration: BoxDecoration(
//             // ignore: prefer_const_constructors
//             image: DecorationImage(
//                 opacity: 0.2,
//                 image: AssetImage(
//                     "assets/images/lovepik-books-mobile-phone-wallpaper-background-image_400470237.jpg"),
//                 fit: BoxFit.fill)),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(36),
//             child: Center(
//               child: Obx(
//                 () => Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         child: "WELCOME TO BOOKSTORE"
//                             .text
//                             .black
//                             .fontWeight(FontWeight.w400)
//                             .size(30)
//                             .make()
//                             .pOnly(left: 50),
//                         // child: Text(
//                         //   'WELCOME TO BOOKSTORE',
//                         //   style: TextStyle(
//                         //       fontSize: 30,
//                         //       color: Colors.black,
//                         //       fontWeight: FontWeight.w400),
//                         // ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           MaterialButton(
//                             color:
//                                 !isLogin.value ? Colors.white : Colors.blueGrey,
//                             onPressed: () {
//                               isLogin.value = true;
//                             },
//                             child: Text('Login'),
//                           ),
//                           MaterialButton(
//                             color:
//                                 isLogin.value ? Colors.white : Colors.blueGrey,
//                             onPressed: () {
//                               isLogin.value = false;
//                             },
//                             child: "Register".text.make(),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 80,
//                       ),
//                       isLogin.value ? loginWidget() : registerWidget()
//                     ]),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget registerWidget() {
//     return Column(
//       children: [
//         InputTextFieldWidget(
//             registerationController.usernameController, 'username'),
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(
//             registerationController.emailController, 'email address'),
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(
//             registerationController.passwordController, 'password'),
//         SizedBox(
//           height: 20,
//         ),
//         SubmitButton(
//           onPressed: () => registerationController.registerWithEmail(),
//           title: 'Register',
//         )
//       ],
//     );
//   }

//   Widget loginWidget() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(loginController.username, 'username'),
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(loginController.passwordController, 'password'),
//         SizedBox(
//           height: 20,
//         ),
//         SubmitButton(
//           onPressed: () => loginController.loginWithEmail(),
//           title: 'Login',
//         )
//       ],
//     );
//   }
// }

// class InputTextFieldWidget extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final String hintText;
//   InputTextFieldWidget(this.textEditingController, this.hintText);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 46,
//       child: TextField(
//         controller: textEditingController,
//         decoration: InputDecoration(
//             alignLabelWithHint: true,
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black)),
//             fillColor: Colors.white54,
//             hintText: hintText,
//             hintStyle: TextStyle(color: Colors.black12),
//             contentPadding: EdgeInsets.only(bottom: 15),
//             focusColor: Colors.white60),
//       ),
//     );
//   }
// }

// class SubmitButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;
//   const SubmitButton({Key? key, required this.onPressed, required this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 180,
//       height: 50,
//       decoration:
//           BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
//         BoxShadow(
//             color: Colors.white.withOpacity(0.25),
//             offset: Offset(0, 0),
//             blurRadius: 2,
//             spreadRadius: 1)
//       ]),
//       child: ElevatedButton(
//           style: ButtonStyle(
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       side: BorderSide.none)),
//               backgroundColor: MaterialStateProperty.all<Color>(
//                 Colors.grey,
//               )),
//           onPressed: onPressed,
//           child: Text(title,
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//               ))),
//     );
//   }
// }
