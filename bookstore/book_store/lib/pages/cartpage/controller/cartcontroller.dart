import 'package:book_store/api/models/book.dart';
import 'package:book_store/api/models/cart.dart';
import 'package:book_store/api/models/cart_total.dart';
import 'package:book_store/api/models/customer.dart';
import 'package:book_store/pages/address/addresscontroller.dart';
import 'package:book_store/pages/mainpage/api/homepagecontroller.dart';
import 'package:book_store/repository_impl/api_repository_impl.dart';
import 'package:book_store/repository_impl/local_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartcontroller extends GetxController {
  // final Addresscontroller addresscontroller = Get.put(Addresscontroller());
  var cartlist = <Cart?>[].obs;
  var carttotallist = <Cart_total?>[].obs;
  RxInt quantity = 2.obs;
  RxBool iscartload = false.obs;
  RxBool isincart = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchcart();
    carttotal();
  }

  bool checkIfProductInCart(int? bookid) {
    return cartlist.value.any((element) => element!.book == bookid);
  }

  void fetchcart() async {
    final token = await Local_repository_impl.getToken();
    print(token);
    try {
      iscartload(true);
      var carts = await Apirepositoryimpl.getCartList(token);
      print("cartlist callled");
      if (carts != null) {
        print("called");
        cartlist(carts);
        print(cartlist);
        carttotal();
      } else {
        Scaffold(body: Text(" Your cart is Empty").centered());
      }
    } catch (e) {
      iscartload(false);
      print(e);
    }
  }

  void addquantity(int? id, int quantity) async {
    final token = await Local_repository_impl.getToken();
    var result = await Apirepositoryimpl.addquantity(token, id, quantity);
    if (result == true) {
      print("quantity added to cart");
      fetchcart();
    }
  }

  void removefromcart(int? id) async {
    final token = await Local_repository_impl.getToken();
    await Apirepositoryimpl.deletecart(token, id);
    fetchcart();
  }

  // clearcart() {
  //   cartlist.clear();
  // }
  clearcart() async {
    final token = await Local_repository_impl.getToken();
    var result = await Apirepositoryimpl.cleartcart(token);
    if (result == true) {
      print("clear cart called");
      fetchcart();
    }
  }

  addtocart(int? uid, int? id) async {
    final token = await Local_repository_impl.getToken();
    print(token);
    if (token != null) {
      var result = await Apirepositoryimpl.addtocart(token, uid, id);
      print("cart addedd called");
      fetchcart();
      if (result == true) {
        print("added cart called");
        Get.snackbar('book added to cart', '',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            borderRadius: 0,
            backgroundColor: Colors.blue.withOpacity(0.8),
            isDismissible: true,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(5));
      }
    }
  }

  getaddress() async {
    final token = await Local_repository_impl.getToken();
    print(token);
    print(" get address  called");
    try {
      var address = await Apirepositoryimpl.getcustomer(token);
      print("address fetched");
      if (address != null) {
        print("address");
      }
    } catch (e) {
      print(e);
    }
  }

  void carttotal() async {
    final token = await Local_repository_impl.getToken();
    try {
      print("cart total called");
      var response = await Apirepositoryimpl.carttotal(token);
      if (response != null) {
        print("cart-total called");
        carttotallist(response);
        print(carttotallist);
      }
    } catch (e) {
      print(e);
    }
  }

  // clearcart() {
  //   print("cart clear list called");
  //   cartlist.clear();
  //   print("cart clear list executed");
  // }

  void showButtomSheed(
      BuildContext context, VoidCallback onTap, int? id) async {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: 200,
            child: Obx(() {
              // var quantity;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text('Selete Quantity'),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.cancel)),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            10,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      quantity(index + 1);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  quantity.value == (index + 1)
                                                      ? Colors.redAccent
                                                      : Colors.black)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text((1 + index).toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      addquantity(id, quantity.value);
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 50,
                        color: Colors.redAccent,
                        width: double.infinity,
                        child: Center(child: Text('Done'))),
                  )
                ],
              );
            })));
  }
}
