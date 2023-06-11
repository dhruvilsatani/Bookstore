import 'package:book_store/api/models/book.dart';
import 'package:book_store/api/models/category.dart';
import 'package:book_store/dashboardcontroller.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/pages/productscreen/populerbook.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
        child: Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 120,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 0.9,
                  child: CachedNetworkImage(
                    imageUrl: category!.image.toString(),
                    placeholder: (context, url) => Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade300,
                      child: Container(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    category!.title.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
