import 'package:book_store/api/models/category.dart';
import 'package:book_store/dashboardcontroller.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/pages/productscreen/populerbook.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class Categorycard extends StatelessWidget {
  final Category? category;
  const Categorycard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Homecontroller homecontroller = Get.put(Homecontroller());
    DashboardController dashboardController = Get.put(DashboardController());
    return InkWell(
      onTap: () {
        dashboardController.updateIndex(1);
        homecontroller.searchTextEditController.text =
            'Category:${category!.title}';
        homecontroller.searchVal.value = 'cat: ${category!.title}';
        homecontroller.getbycategory(category?.id);
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => Productscreen())));
      },
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey.shade300,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 16,
                  child: Center(
                    child: CachedNetworkImage(
                      height: 220,
                      imageUrl: category!.image.toString(),
                      placeholder: (context, url) => Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: Colors.grey.shade300,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      errorWidget: ((context, url, error) => Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        category!.title.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
