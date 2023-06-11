import 'package:book_store/api/models/book.dart';
import 'package:book_store/api/models/category.dart';
import 'package:book_store/api/models/offer.dart';
import 'package:book_store/api/models/profile.dart';
import 'package:book_store/pages/mainpage/categories/categoryscreen.dart';
//import 'package:book_store/repository/api_repository.dart';
//import 'package:book_store/repository/local_repository.dart';
import 'package:book_store/repository_impl/api_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  Rx<User> user = User.empty().obs;
  var bookList = <Books?>[].obs;
  var bookList1 = <Books?>[].obs;
  var offerList = <Offer?>[].obs;
  var categoryList = <Category?>[].obs;

  void fetchbook() async {
    print("called");
    try {
      print("called5");
      var product = await Apirepositoryimpl.fetchproduct();
      if (product != null) {
        print("called");
        bookList.value = product;
        bookList1.value = product;
        print(product);
        print(bookList);
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchoffer() async {
    try {
      var response = await Apirepositoryimpl.getoffer();
      if (response != null) {
        print(" offer called");
        offerList(response);
      }
    } catch (e) {
      print(e);
    }
  }

  void getcategory() async {
    print("called");
    try {
      print("called5");
      var category = await Apirepositoryimpl.getCategories();
      if (category != null) {
        print("called");
        categoryList.value = category;
        print(category);
        print(bookList);
      }
    } catch (e) {
      print(e);
    }
  }

  void getbyname(String keyword) async {
    var product = await Apirepositoryimpl.getByName(keyword: keyword);
    if (product != null) {
      bookList.value = product;
    } else {
      null;
    }
  }

  void getbycategory(int? id) async {
    var product = await Apirepositoryimpl.getCategoriesProduct(id);
    if (product != null) {
      bookList.value = product;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchbook();
    getcategory();
    fetchoffer();
  }
}
