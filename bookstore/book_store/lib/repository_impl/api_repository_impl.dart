// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:book_store/api/models/book.dart';
import 'package:book_store/api/models/cart.dart';
import 'package:book_store/api/models/cart_total.dart';
import 'package:book_store/api/models/category.dart';
import 'package:book_store/api/models/customer.dart';
import 'package:book_store/api/models/offer.dart';
import 'package:book_store/api/models/orders.dart';
import 'package:book_store/api/models/profile.dart';

import 'package:book_store/request/login_request.dart';
import 'package:book_store/request/register_request.dart';
import 'package:book_store/respons/login_response.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class Apirepositoryimpl {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static var client = http.Client();
  static Uri getMainUrl(String endpoind,
      {String baseUrl = 'dhruvilsatani.pythonanywhere.com'}) {
    var url = Uri.https('${(baseUrl)}', '${(endpoind)}', {'q': '{https}'});
    return url;
  }

  static Map<String, String> header(String token) => {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
  // ignore: avoid_renaming_method_parameters
  Future<LoginResponse?> register(RegisterRequest registerRequest) async {
    print('register');
    var result = await client.post(getMainUrl('/data/register/'), body: {
      "username": registerRequest.username,
      "email": registerRequest.email,
      "password": registerRequest.password
    });
    print('register');
    if (result.statusCode == 200) {
      var jsondata = result.body;
      print('Register');
      return loginResponseFromJson(jsondata);
    } else {
      return null;
    }
  }

  Future<void> logout(String? token) async {
    print('removing token');
    return;
  }

  //
  // Future<LoginResponse?> getuserfromtoken(String? token) async {
  //   var result = await client.get(getMainUrl('/data/profile/'), headers: {
  //     "Content-type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer $token"
  //   });
  //   if (result.statusCode == 200) {
  //     var jsonData = result.body;
  //     print('login');
  //     print(jsonData);
  //     return loginResponseFromJson(jsonData);
  //   } else {
  //     return null;
  //   }
  // }

  Future<LoginResponse?> login(LoginRequest login) async {
    var result = await client.post(getMainUrl('/data/login/'),
        body: {'username': login.username, 'password': login.password});

    if (result.statusCode == 200) {
      var jsonData = result.body;
      print('login');
      print(jsonData);
      return loginResponseFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<List<Books?>?> fetchproduct() async {
    print("called7");
    var result = await http.Client()
        .get(Uri.parse("https://dhruvilsatani.pythonanywhere.com/data/books/"));

    if (result.statusCode == 200) {
      print("called6");
      var jsonData = result.body;
      print('Fetch product called');
      return booksFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<User?> getprofile(String? token) async {
    print("called67");
    print(token);
    var response = await http.Client().get(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/profile/'),
        headers: {'Authorization': 'token $token'});

    if (response.statusCode == 200) {
      print("profile called");
      var jsonData = jsonDecode(response.body.toString());
      //List list = (jsonDecode(jsonData) as List<dynamic>);
      print(jsonData);
      print(jsonData["email"]);
      print(jsonData);
      print('Fetch profile called');

      return User.fromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<List<Category?>?> getCategories() async {
    print("called7");
    var result = await http.Client().get(
        Uri.parse("https://dhruvilsatani.pythonanywhere.com/data/category/"));

    if (result.statusCode == 200) {
      print("called6");
      var jsonData = result.body;
      print('Fetch product called');
      return categoryFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<dynamic> getByName({required String keyword}) async {
    var result = await http.Client().get(Uri.parse(
        "https://dhruvilsatani.pythonanywhere.com/data/books/?search=$keyword "));

    var jsonData = result.body;
    if (result.statusCode == 200) {
      return booksFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<List<Books?>?> getCategoriesProduct(int? categoryid) async {
    var result = await http.Client().get(Uri.parse(
        "https://dhruvilsatani.pythonanywhere.com/data/books/?search=$categoryid "));
    var jsonData = result.body;
    if (result.statusCode == 200) {
      return booksFromJson(jsonData);
    } else {
      return null;
    }
  }

  //get books by category baki che

  static Future<List<Cart?>?> getCartList(String? token) async {
    var result = await http.Client().get(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/cart/'),
        headers: {'Authorization': 'token $token'});
    if (result.statusCode == 200) {
      var jsonData = result.body;
      print('getCartList');

      return cartFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<bool> addtocart(String? token, int? uid, int? id) async {
    var result = await http.Client().post(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/cart/'),
        headers: {'Authorization': 'token $token'},
        body: {"user": "$uid", "book": "$id"});
    print("cart added api called");
    if (result.statusCode == 200) {
      print("cart added api fetch called ");
      return true;
    }
    return false;
  }

  static Future<bool> logouts(String? token) async {
    var result = await http.Client().post(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/cart/'),
        headers: {'Authorization': 'token $token'});
    print("logout called");
    if (result.statusCode == 200) {
      print("cart added api fetch called ");
      return true;
    }
    return false;
  }

  static Future<List<Cart_total?>?> carttotal(String? token) async {
    var result = await http.Client().get(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/cart-total/'),
        headers: {'Authorization': 'token $token'});
    print("cart total api called");
    if (result.statusCode == 200) {
      var jsondata = result.body;
      print("cart added api fetch called ");
      return cart_totalFromJson(jsondata);
    }
    return null;
  }

  static Future<bool?> deletecart(String? token, int? id) async {
    var result = await http.Client().delete(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/cart/$id/'),
        headers: {'Authorization': 'token $token'});

    if (result.statusCode == 204) {
      return true;
    }
    return false;
  }

  static Future<bool?> cleartcart(String? token) async {
    var result = await http.Client().delete(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/cart/'),
        headers: {'Authorization': 'token $token'});

    if (result.statusCode == 204) {
      return true;
    }
    return false;
  }

  static Future<bool?> addquantity(
      String? token, int? id, int? quantity) async {
    print('Add Quantity');
    print('$token, $id, $quantity');
    var result = await http.Client().patch(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/cart/$id/'),
        headers: {'Authorization': 'token $token'},
        body: {"quantity": "$quantity"});
    print('Add Quantity');

    if (result.statusCode == 205) {
      print("quantity called");
      return true;
    }
    return false;
  }

  static Future<List<Customer?>?> getcustomer(String? token) async {
    print("get customer callled");
    var result = await http.Client().get(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/customer/'),
        headers: {'Authorization': 'token $token'});
    if (result.statusCode == 200) {
      var jsonData = result.body;
      print('getCartList');

      return customerFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<bool?> postorder(
      String? token, int? uid, int? customer, int? bid, int? quantity) async {
    print("called postorder");
    print('${token},${uid},${customer},${bid}');
    var result = await http.Client().post(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/orders/'),
        headers: {
          'Authorization': 'token $token'
        },
        body: {
          "user": "$uid",
          "customer": "$customer",
          "book": "$bid",
          "quantity": "$quantity"
        });

    if (result.statusCode == 200) {
      print("ordered successfully");
      return true;
    }
    return false;
  }

  static Future<List<Order?>?> getorders(String? token) async {
    var result = await http.Client().get(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/orders/'),
        headers: {'Authorization': 'token $token'});
    if (result.statusCode == 200) {
      var jsonData = result.body;
      print('getCartList');

      return orderFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<List<Offer?>?> getoffer() async {
    print("offer called");
    var result = await http.Client().get(
      Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/offer/'),
    );
    if (result.statusCode == 200) {
      var jsonData = result.body;
      print("offer fetched");

      return offerFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<bool?> cancelorder(String? token, int? id) async {
    var result = await http.Client().delete(
        Uri.parse('https://dhruvilsatani.pythonanywhere.com/data/orders/$id/'),
        headers: {'Authorization': 'token $token'});

    if (result.statusCode == 204) {
      return true;
    }
    return false;
  }
}
