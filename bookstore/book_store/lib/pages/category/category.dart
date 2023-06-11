import 'package:book_store/pages/category/categorycars.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Categoryscreen extends StatelessWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());
  Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            (() {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  itemCount: homecontroller.categoryList.length,
                  itemBuilder: ((context, index) => Categorycard(
                      category: homecontroller.categoryList[index])));
            }),
          )),
    );
  }
}
