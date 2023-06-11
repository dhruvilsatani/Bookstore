import 'package:book_store/api/models/book.dart';
import 'package:book_store/api/models/cart.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/pages/product_detail/product_detailcard.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Imageslider extends StatelessWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    // if (homecontroller.offerList.isNotEmpty) {
    return Container(
        height: 220,
        child: CarouselSlider.builder(
            itemCount: homecontroller.offerList.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    var books = homecontroller.offerList[index];
                    var publisherdetail = RDetail(
                        id: books!.bookDetail.publisherDetail.id,
                        name: books.bookDetail.publisherDetail.name.toString());
                    var authordetail = RDetail(
                        id: books.bookDetail.authorDetail.id,
                        name: books.bookDetail.authorDetail.name.toString());
                    var categorydetail = CategoryDetail(
                        id: books.bookDetail.categoryDetail.id,
                        title: books.bookDetail.categoryDetail.title,
                        image: books.bookDetail.categoryDetail.image);
                    var book = Books(
                        id: books.book,
                        name: books.bookDetail.name,
                        category: books.bookDetail.category,
                        categoryDetail: categorydetail,
                        sellingPrice: books.bookDetail.sellingPrice,
                        discountedPrice: books.bookDetail.discountedPrice,
                        author: books.bookDetail.author,
                        authorDetail: authordetail,
                        publisher: books.bookDetail.publisher,
                        description: books.bookDetail.description,
                        publisherDetail: publisherdetail,
                        image: books.bookDetail.image);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  books: book,
                                )));
                  },
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.0),
                      child: Obx(
                        () => Image(
                          image: NetworkImage(
                              homecontroller.offerList[index]!.image),

                          // image: NetworkImage(
                          //   if(homecintroller)
                          //   )
                          //   homecontroller
                          //         .offerList[index]!.image ??
                          //     'assets/images/library-research-ancient-article-back-to-school-background-book-background-library-119263255.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              aspectRatio: 0.4,
            )));
  }
}

class Sliders extends StatelessWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());
  Sliders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220.0,
        child: CarouselSlider.builder(
            itemCount: homecontroller.offerList.length,
            itemBuilder: (context, index, realIndex) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.0),
                      child: Image(
                        image: AssetImage(
                            'assets/images/library-research-ancient-article-back-to-school-background-book-background-library-119263255.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              aspectRatio: 0.5,
            )));
  }
}
// onTap: () {
//                       var books = homecontroller.offerList[index];
//                       var publisherdetail = RDetail(
//                           id: books!.bookDetail.publisherDetail.id,
//                           name:
//                               books.bookDetail.publisherDetail.name.toString());
//                       var authordetail = RDetail(
//                           id: books.bookDetail.authorDetail.id,
//                           name: books.bookDetail.authorDetail.name.toString());
//                       var categorydetail = CategoryDetail(
//                           id: books.bookDetail.categoryDetail.id,
//                           title: books.bookDetail.categoryDetail.title,
//                           image: books.bookDetail.categoryDetail.image);
//                       var book = Books(
//                           id: books.book,
//                           name: books.bookDetail.name,
//                           category: books.bookDetail.category,
//                           categoryDetail: categorydetail,
//                           sellingPrice: books.bookDetail.sellingPrice,
//                           discountedPrice: books.bookDetail.discountedPrice,
//                           author: books.bookDetail.author,
//                           authorDetail: authordetail,
//                           publisher: books.bookDetail.publisher,
//                           description: books.bookDetail.description,
//                           publisherDetail: publisherdetail,
//                           image: books.bookDetail.image);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProductDetailsScreen(
//                                     books: book,
//                                   )));