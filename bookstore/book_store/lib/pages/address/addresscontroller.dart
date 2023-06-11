import 'package:book_store/api/models/customer.dart';
import 'package:book_store/pages/account/controller/profilecontroller.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:book_store/repository_impl/api_repository_impl.dart';
import 'package:book_store/repository_impl/local_repository_impl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Addresscontroller extends GetxController {
  var customerlist = <Customer?>[].obs;
  var selectedaddress = Rx<Customer?>(null);

  void setaddress(Customer address) {
    if (customerlist.isNotEmpty) {
      selectedaddress.value = customerlist[0];
    }
    selectedaddress.value = address;

    print(selectedaddress.value);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getaddress();
  }

  Cartcontroller cartcontroller = Get.put(Cartcontroller());
  Profilecontroller profilecontroller = Get.put(Profilecontroller());
  TextEditingController name = TextEditingController();
  TextEditingController locality = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController state = TextEditingController();

  addadress() async {
    final token = await Local_repository_impl.getToken();
    print(token);
    print(profilecontroller.profilelist.value!.id);
    print(cartcontroller.cartlist.value.first!.id);

    print("add address called ");
    try {
      print("add address called1");
      var result = await http.Client().post(
          Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/customer/'),
          headers: {
            'Authorization': 'token $token'
          },
          body: {
            "user": profilecontroller.profilelist.value!.id.toString(),
            "name": name.text,
            "locality": locality.text,
            "city": city.text,
            "zipcode": zipcode.text,
            "state": state.text
          });
      print("called");
      if (result.statusCode == 200) {
        getaddress();
        Fluttertoast.showToast(
            msg: 'Address added successfully',
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            // timeInSecForIosWeb:2
            //class superlist():
            //def __len__:
            //Super_list1=SuperList();
            //len(super_list1)
            //return 1000
            //
            //
            //
            //
            backgroundColor: Colors.green,
            textColor: Colors.black);
        print("address added");
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'you made some mistake please check',
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black);
    }
  }

  getaddress() async {
    final token = await Local_repository_impl.getToken();
    print(token);
    // print(" get address  called");
    try {
      var address = await Apirepositoryimpl.getcustomer(token);
      print("address fetched");
      if (address != null) {
        print("address");
        customerlist(address);
      }
    } catch (e) {
      print(e);
    }
  }

  updateaddress(int? id, int? user, String? name, String? locality,
      String? city, String? zipcode, String? state) async {
    final token = await Local_repository_impl.getToken();
    print('Add Quantity');
    print('$token, $id');
    var result = await http.Client().put(
        Uri.parse(
            'https://dhruvilsatani.pythonanywhere.com/data/customer/$id/'),
        headers: {
          'Authorization': 'token $token'
        },
        body: {
          "user": "$user",
          "name": "$name",
          "locality": "$locality",
          "city": "$city",
          "zipcode": "$zipcode",
          "state": "$state",
        });
    print('Add Quantity');

    if (result.statusCode == 205) {
      getaddress();
      print("updated address successfully");
      Fluttertoast.showToast(
          msg: 'Address updated successfully',
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black);

      return true;
    }
    return false;
  }

  deleteaddress(int? id) async {
    print("delete address called");
    final token = await Local_repository_impl.getToken();
    var result = await http.Client().delete(
        Uri.parse(
            'https://dhruvilsatani.pythonanywhere.com/data/customer/$id/'),
        headers: {'Authorization': 'token $token'});
    if (result.statusCode == 204) {
      print("deleted successfully");
      Fluttertoast.showToast(
          msg: 'Address deleted successfully',
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black);
      print("address added");
      getaddress();
      return true;
    } else {
      return false;
    }
  }
}
