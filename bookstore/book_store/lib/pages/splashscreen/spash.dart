import 'package:book_store/main.dart';

import 'package:book_store/pages/loginpage/loginpage.dart';
import 'package:book_store/pages/mainpage.dart';
import 'package:book_store/pages/mainpage/homepage.dart';
import 'package:book_store/pages/productscreen/populerbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class spalsh extends StatefulWidget {
  const spalsh({super.key});

  @override
  State<spalsh> createState() => _spalshState();
}

class _spalshState extends State<spalsh> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/99349-girl-with-books.json'),
      nextScreen: Mainpage(),
      splashIconSize: 260,
    );
  }
}
