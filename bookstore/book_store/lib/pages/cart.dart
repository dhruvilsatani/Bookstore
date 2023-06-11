import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: "Cart".text.black.make(),
      ),
      body: Stack(
        children: [
          Container(),
          Positioned.fill(
              child: ListView.builder(
                  itemBuilder: ((context, index) => Container(
                        height: 100,
                        width: 100,
                        color: Colors.green,
                        margin: EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              color: Colors.blue,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Title".text.make(),
                                "Description".text.make(),
                                "price".text.make()
                              ],
                            )
                          ],
                        ),
                      ))))
        ],
      ),
      // body: Obx(() {
      //   return Stack(
      //     children: [
      //       SingleChildScrollView(
      //           child: ListView.builder(
      //               shrinkWrap: true,
      //               itemBuilder: ((context, index) => Container(
      //                     height: 100,
      //                     width: 100,
      //                     color: Colors.blue,
      //                     margin: EdgeInsets.all(4.0),
      //                   )))),
      //     ],
      //   );
      // }),

      // body: Scaffold(
      //   body: Stack(
      //     children: [
      //       Container(),
      //       SingleChildScrollView(
      //           child: ListView.builder(
      //               shrinkWrap: true,
      //               itemBuilder: ((context, index) => Container(
      //                     height: 100,
      //                     width: 100,
      //                     color: Colors.blue,
      //                     margin: EdgeInsets.all(4.0),
      //                   )))),
      //     ],
      //   ),
      // ),
    );
  }
}
