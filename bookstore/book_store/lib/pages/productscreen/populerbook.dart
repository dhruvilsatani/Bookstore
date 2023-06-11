// import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
// import 'package:book_store/pages/mainpage/topbar.dart';
// import 'package:book_store/pages/productscreen/populercard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Productscreen extends StatelessWidget {
//   final Homecontroller homecontroller = Get.put(Homecontroller());

//   Productscreen({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             appbar().paddingOnly(top: 35),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Obx(() {
//                   return GridView.builder(
//                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                         maxCrossAxisExtent: 200,
//                         childAspectRatio: 2 / 3,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10),
//                     physics: BouncingScrollPhysics(),
//                     padding: EdgeInsets.all(10),
//                     itemCount: homecontroller.bookList.length,
//                     itemBuilder: ((context, index) => Bookcard(
//                           books: homecontroller.bookList[index],
//                         )),
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/pages/mainpage/topbar.dart';
import 'package:book_store/pages/productscreen/populercard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Productscreen extends StatelessWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());

  Productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar().paddingOnly(top: 35),
          Expanded(
            child: Padding(
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
                        itemCount: homecontroller.bookList.length,
                        itemBuilder: (context, index) => Bookcard(
                              context: context,
                              books: homecontroller.bookList[index],
                            ));
                  }),
                )),
          ),
        ],
      ),
    );
  }
}
   // child: GridView.builder(
                  //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //         maxCrossAxisExtent: 200,
                  //         childAspectRatio: 2 / 3,
                  //         crossAxisSpacing: 10,
                  //         mainAxisSpacing: 10),
                  //     physics: BouncingScrollPhysics(),
                  //     padding: EdgeInsets.all(10),
                  //     itemCount: homecontroller.bookList.length,
                  //     itemBuilder: ((context, index) => Bookcard(
                  //           books: homecontroller.bookList[index],
                  //         ))),