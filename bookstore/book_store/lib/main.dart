import 'package:book_store/pages/cart.dart';
import 'package:book_store/pages/loginpage/loginpage.dart';
import 'package:book_store/pages/mainpage.dart';
import 'package:book_store/pages/mainpage/homepage.dart';
import 'package:book_store/pages/splashscreen/spash.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: spalsh(),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
