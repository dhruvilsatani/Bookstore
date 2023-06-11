import 'package:badges/badges.dart' as badge;
import 'package:book_store/pages/cartpage/cartpage.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/pages/productscreen/populerbook.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class appbar extends StatelessWidget {
  appbar({super.key});

  final Cartcontroller cartcontroller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    Homecontroller homecontroller = Get.put(Homecontroller());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Obx(() {
              return TextField(
                autofocus: false,
                controller: homecontroller.searchTextEditController,
                onSubmitted: (val) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Productscreen()));
                  homecontroller.getbyname(val);
                  //dashboardController.updateIndex(1);
                },
                onChanged: (val) {
                  homecontroller.searchVal.value = val;
                },
                decoration: InputDecoration(
                    suffixIcon: homecontroller.bookList.value.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              homecontroller.searchTextEditController.clear();
                              homecontroller.searchVal.value = '';

                              homecontroller.fetchbook();
                            },
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none),
                    hintText: "Search...",
                    prefixIcon: const Icon(Icons.search)),
              );
            }),
          ),

          //     child: TextField(
          //   decoration: InputDecoration(
          //       filled: true,
          //       fillColor: Color.fromARGB(255, 232, 225, 225),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //           borderSide: BorderSide.none),
          //       contentPadding: const EdgeInsets.symmetric(vertical: 0),
          //       prefixIcon: Icon(
          //         Icons.search_outlined,
          //         color: Theme.of(context).colorScheme.onSurface,
          //         size: 30,
          //       ),
          //       hintText: 'Search book here..',
          //       hintStyle: TextStyle(color: Colors.grey[600])),
          // ))
          // ,

          const SizedBox(width: 10),

          badge.Badge(
            badgeContent: Obx((() => Text(
                  cartcontroller.cartlist.length.toString(),
                  style: TextStyle(color: Colors.white),
                ))),
            badgeStyle:
                badge.BadgeStyle(badgeColor: Theme.of(context).primaryColor),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cartpage()));
              },
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6), blurRadius: 8)
                    ]),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
