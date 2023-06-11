import 'package:book_store/api/models/book.dart';
import 'package:book_store/pages/product_detail/product_detailcard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class Bookcard extends StatelessWidget {
  final Books? books;
  final BuildContext context;
  const Bookcard({
    Key? key,
    required this.books,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(books: books)));
      },
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 5,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: books!.image.toString(),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    books!.name.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '\₹${books!.discountedPrice.toString()}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '\₹${books!.sellingPrice.toString()}',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 17,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ).pOnly(left: 3)
            ],
          ),
        ),
      ),
    );
  }
}
