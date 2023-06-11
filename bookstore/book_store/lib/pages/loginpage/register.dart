import 'package:book_store/pages/loginpage/logincontroller.dart';
import 'package:book_store/pages/loginpage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Registerpage extends StatefulWidget {
  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
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
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => LoginPage())));
          },
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            // margin:
            // EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
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
                    // CircleAvatar(
                    //   backgroundColor: Colors.white,
                    //   radius: 75,
                    //   child: Lottie.asset('images/77792-book.json'),
                    // ),

                    // SizedBox(height: 30),
                    // Icon(
                    //   Icons.book_rounded,
                    //   color: Colors.blueAccent,
                    //   size: 80,
                    // ),
                    // Text(
                    //   'BOOK STORE',
                    //   style: TextStyle(
                    //     color: Colors.blueAccent,
                    //     fontSize: 20,
                    //     letterSpacing: 4.0,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Register Here',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: registerationController.usernameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.supervised_user_circle_outlined,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Your Username here',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Username';
                          } else if (value.length < 10 || value.length > 10) {
                            return 'username should be under 10 character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: registerationController.emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Your Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blueAccent,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: registerationController.passwordController,
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
                Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            registerationController.registerWithEmail();
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
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an Account ?'),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(LoginPage());
                            },
                            child: Text(
                              'Login Here',
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
