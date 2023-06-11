import 'package:book_store/api/models/category.dart';
import 'package:book_store/pages/mainpage/categories/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Categories extends StatelessWidget {
  final List<Category?> categories;
  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: categories.length,
          addAutomaticKeepAlives: true,
          itemBuilder: ((context, index) =>
              Categorycard(category: categories[index]))),
    );
  }
}
