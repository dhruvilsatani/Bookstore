import 'package:book_store/api/models/cart.dart';
import 'package:book_store/api/models/orders.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:book_store/repository_impl/api_repository_impl.dart';
import 'package:book_store/repository_impl/local_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Ordercontroller extends GetxController {
  Cartcontroller cartcontroller = Get.put(Cartcontroller());
  var orderlist = <Order?>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchorder();
  }

  fetchorder() async {
    final token = await Local_repository_impl.getToken();
    var response = await Apirepositoryimpl.getorders(token);
    if (response != null) {
      print("order fetched ");
      orderlist(response);
    } else {
      print("failed to fetch order");
    }
  }

  addorder(int? uid, int? custid, List<Cart?> cart) async {
    final token = await Local_repository_impl.getToken();
    for (var cartitem in cart) {
      var response = await Apirepositoryimpl.postorder(
          token, uid, custid, cartitem!.book, cartitem.quantity);

      if (response == true) {
        fetchorder();

        print("all cart item ordered");
      }
    }

    // var response = await Apirepositoryimpl.postorder(token, uid, cid, custid);
    // if (response == true) {
    //   fetchorder();
    //   Fluttertoast.showToast(
    //       msg: 'Address added successfully',
    //       gravity: ToastGravity.TOP,
    //       timeInSecForIosWeb: 2,
    //       backgroundColor: Colors.green,
    //       textColor: Colors.black);
    //   print("Order placed successfully");
    // }
  }

  deleteorder(int? id) async {
    final token = await Local_repository_impl.getToken();
    var response = await Apirepositoryimpl.cancelorder(token, id);
    if (response == true) {
      fetchorder();
      Fluttertoast.showToast(
          msg: 'Order cancelled  successfully',
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black);
    }
  }
}
