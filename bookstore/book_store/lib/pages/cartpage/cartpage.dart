import 'package:book_store/pages/account/controller/profilecontroller.dart';
import 'package:book_store/pages/cartpage/cartitem.dart';
import 'package:book_store/pages/cartpage/checkoutcart.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatefulWidget {
  Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());

  final Cartcontroller cartcontroller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (profilecontroller.profilelist.value!.id != null &&
                  cartcontroller.cartlist.isNotEmpty) {
                return Cart1();
              } else {
                return Cart2();
              }
            }),
          ),
        ],
      ),
    );
  }
}

class Cart1 extends StatefulWidget {
  Cart1({super.key});

  @override
  State<Cart1> createState() => _Cart1State();
}

class _Cart1State extends State<Cart1> {
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());

  final Cartcontroller cartcontroller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Obx((() {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: cartcontroller.cartlist.length,
                      itemBuilder: ((context, index) =>
                          Cartitem(cart: cartcontroller.cartlist[index])));
                })),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CheckoutCart(),
    );
  }
}

class Cart2 extends StatelessWidget {
  const Cart2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "Please check  your are login ?"
                .text
                .xl3
                .bold
                .bold
                .bold
                .maxLines(5)
                .make()
                .centered()
                .pOnly(left: 0)
                .shimmer(),
            "OR"
                .text
                .xl3
                .bold
                .bold
                .bold
                .maxLines(5)
                .make()
                .centered()
                .pOnly(left: 0)
                .shimmer(),
            "ADD Books In Cart "
                .text
                .xl3
                .bold
                .bold
                .bold
                .maxLines(5)
                .make()
                .centered()
                .pOnly(left: 0)
                .shimmer(),
          ],
        ),
      ),
      //  bottomNavigationBar: CheckoutCart(),
    );
  }
}
