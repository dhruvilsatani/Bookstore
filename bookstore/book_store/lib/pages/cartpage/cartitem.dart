import 'package:book_store/api/models/cart.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartitem extends StatelessWidget {
  final Cartcontroller cartcontroller = Get.put(Cartcontroller());
  final Cart? cart;
  Cartitem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expanded(
        //   child: Obx(() {
        //     return SizedBox(
        //         height: 20,
        //         child: IconButton(
        //           onPressed: () {
        //             //controller.selectCart(cart!);
        //           },
        //           icon: Icon(Icons.check_box),
        //           // icon: homeController.selectedCarts.contains(cart!.id)
        //           //     ? Icon(Icons.check_box)
        //           //     : Icon(Icons.check_box_outline_blank)
        //         ));
        //   }),
        // ),
        Expanded(
          child: Container(
            height: 130,
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0.8,
                shadowColor: Colors.black,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      // onTap: () => Navigator.pushNamed(
                      //     context, SajiloDokanRoutes.productDetails,
                      //     arguments:
                      //         ProductDetailsArguments(product: cart!.product)),
                      child: Container(
                        height: 85,
                        width: 50,
                        child: Image.network(cart!.bookDetail!.image.toString(),
                            height: 100),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 40, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cart!.bookDetail!.name.toString(),
                                //cart!.product!.title!,
                                style: GoogleFonts.ptSans(),
                                overflow: TextOverflow.ellipsis),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              //"",
                              cart!.bookDetail!.description.toString(),
                              //cart!.product!.description!,
                              maxLines: 2,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // "",
                                  'Rs ' + cart!.price.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent),
                                ),
                                InkWell(
                                    onTap: () {
                                      cartcontroller.quantity(cart!.quantity);
                                      cartcontroller.showButtomSheed(
                                          context, () {}, cart!.id);
                                      // controller.quantity(cart!.quantity!);
                                      //controller.showButtomSheed(
                                      //  context, () {}, cart!.id);
                                    },
                                    // child: Text('abc')),
                                    child: Text('Qty:${cart!.quantity} ▾'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          cartcontroller.removefromcart(cart!.id);
                          // homeController.removeProductFromCart(cart!.id);
                        },
                        icon: Icon(Icons.cancel))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
