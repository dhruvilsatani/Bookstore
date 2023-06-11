import 'package:book_store/pages/category/category.dart';
import 'package:book_store/pages/mainpage/categories/categoryscreen.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/pages/mainpage/populer_product/populer_book.dart';
import 'package:book_store/pages/mainpage/populer_product/populer_product_loading.dart';
import 'package:book_store/pages/mainpage/populer_product/title.dart';
import 'package:book_store/pages/mainpage/slider/imageslider.dart';
import 'package:book_store/pages/productscreen/populerbook.dart';
import 'package:book_store/pages/mainpage/topbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());

  HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Homecontroller homecontroller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 239, 176, 197),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                SizedBox(
                  height: 4.0,
                ),
                appbar(),
                SizedBox(
                  height: 6,
                ),
                Obx(() {
                  if (homecontroller.offerList.isNotEmpty) {
                    return Imageslider();
                  } else {
                    return Sliders();
                  }
                }),
                SizedBox(
                  height: 7,
                ),
                Sectiontitle(
                  title: "Populer Books",
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Productscreen()));
                  },
                ),
                Obx((() {
                  if (homecontroller.bookList.isNotEmpty) {
                    return Popularbook(populerbooks: homecontroller.bookList1);
                  } else {
                    return Populerproductloading();
                  }
                })),
                Sectiontitle(
                  title: "Categories",
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Categoryscreen()));
                  },
                ),
                Obx((() {
                  if (homecontroller.categoryList.isNotEmpty) {
                    return Categories(categories: homecontroller.categoryList);
                  } else {
                    return Populerproductloading();
                  }
                }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
