import 'package:book_store/pages/account/controller/profilecontroller.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:book_store/repository_impl/local_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import '../../api/models/book.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Books? books;

  const ProductDetailsScreen({super.key, required this.books});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final Cartcontroller cartcontroller = Get.put(Cartcontroller());
  Profilecontroller profilecontroller = Get.put(Profilecontroller());
  NumberFormat formatter = NumberFormat('00');
  int _qty = 1;
  int _tagIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: Hero(
                tag: widget.books!.image.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image.network(
                    widget.books!.image.toString(),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                // "",
                widget.books!.name.toString(),
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ).shimmer(),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    // "",
                    '\₹${widget.books!.discountedPrice.toString()}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  '\₹${widget.books!.sellingPrice.toString()}',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 17,
                      color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Author:',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.books!.authorDetail.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Publisher:',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.books!.publisherDetail.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1),
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(8))),
                  //   child: Row(
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           if (_qty > 1) {
                  //             setState(() {
                  //               _qty--;
                  //             });
                  //           }
                  //         },
                  //         child: Icon(
                  //           Icons.keyboard_arrow_left_sharp,
                  //           size: 32,
                  //           color: Colors.grey.shade800,
                  //         ),
                  //       ),
                  //       Text(
                  //         formatter.format(_qty),
                  //         style: TextStyle(
                  //             fontSize: 18, color: Colors.grey.shade800),
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             _qty++;
                  //           });
                  //         },
                  //         child: Icon(
                  //           Icons.keyboard_arrow_right_sharp,
                  //           size: 32,
                  //           color: Colors.grey.shade800,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1),
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(8))),
                  // ),
                  // "pages:- ${widget.books!.publisher}"
                  //     .text
                  //     .xl3
                  //     .blue300
                  //     .make()
                  //     .pOnly(left: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'About this product:',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.books!.description.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 28, 24, 35)),
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 109, 153, 228)),
          ),
          onPressed: () async {
            bool isInCart =
                cartcontroller.checkIfProductInCart(widget.books!.id);
            if (isInCart) {
              Fluttertoast.showToast(
                  msg: 'Product already in cart',
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.green,
                  textColor: Colors.black);
            } else if (profilecontroller.profilelist.value!.id != null) {
              cartcontroller.addtocart(
                  profilecontroller.profilelist.value!.id, widget.books!.id);
              Fluttertoast.showToast(
                  msg: 'Product Added successfully',
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.green,
                  textColor: Colors.black);
            } else {
              Fluttertoast.showToast(
                  msg: 'please Login to buy Books',
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.green,
                  textColor: Colors.black);
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              'Add to Card',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
