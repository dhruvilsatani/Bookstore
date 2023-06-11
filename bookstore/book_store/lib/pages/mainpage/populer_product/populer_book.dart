import 'package:book_store/api/models/book.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/pages/mainpage/populer_product/populerproductcard.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Popularbook extends StatelessWidget {
  final List<Books?> populerbooks;
  const Popularbook({super.key, required this.populerbooks});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        padding: EdgeInsets.only(right: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          addRepaintBoundaries: true,
          physics: const BouncingScrollPhysics(),
          itemCount: populerbooks.length,
          itemBuilder: (context, index) => Populerproductcard(
            books: populerbooks[index],
          ),
        ));
  }
}
