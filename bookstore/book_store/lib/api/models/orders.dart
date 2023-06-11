// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.id,
    required this.user,
    required this.book,
    required this.bookDetail,
    required this.customer,
    required this.customerDetail,
    required this.quantity,
    required this.price,
    required this.orderDate,
    required this.status,
  });

  int id;
  int user;
  int book;
  BookDetail bookDetail;
  int customer;
  CustomerDetail customerDetail;
  int quantity;
  int price;
  DateTime orderDate;
  String status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        user: json["user"],
        book: json["book"],
        bookDetail: BookDetail.fromJson(json["book_detail"]),
        customer: json["customer"],
        customerDetail: CustomerDetail.fromJson(json["customer_detail"]),
        quantity: json["quantity"],
        price: json["price"],
        orderDate: DateTime.parse(json["order_date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "book": book,
        "book_detail": bookDetail.toJson(),
        "customer": customer,
        "customer_detail": customerDetail.toJson(),
        "quantity": quantity,
        "price": price,
        "order_date": orderDate.toIso8601String(),
        "status": status,
      };
}

class BookDetail {
  BookDetail({
    required this.id,
    required this.name,
    required this.category,
    required this.categoryDetail,
    required this.sellingPrice,
    required this.discountedPrice,
    required this.author,
    required this.authorDetail,
    required this.publisher,
    required this.description,
    required this.publisherDetail,
    required this.image,
  });

  int id;
  String name;
  int category;
  CategoryDetail categoryDetail;
  int sellingPrice;
  int discountedPrice;
  int author;
  RDetail authorDetail;
  int publisher;
  String description;
  RDetail publisherDetail;
  String image;

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        categoryDetail: CategoryDetail.fromJson(json["category_detail"]),
        sellingPrice: json["selling_price"],
        discountedPrice: json["discounted_price"],
        author: json["author"],
        authorDetail: RDetail.fromJson(json["author_detail"]),
        publisher: json["publisher"],
        description: json["description"],
        publisherDetail: RDetail.fromJson(json["publisher_detail"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "category_detail": categoryDetail.toJson(),
        "selling_price": sellingPrice,
        "discounted_price": discountedPrice,
        "author": author,
        "author_detail": authorDetail.toJson(),
        "publisher": publisher,
        "description": description,
        "publisher_detail": publisherDetail.toJson(),
        "image": image,
      };
}

class RDetail {
  RDetail({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory RDetail.fromJson(Map<String, dynamic> json) => RDetail(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class CategoryDetail {
  CategoryDetail({
    required this.id,
    required this.title,
    required this.image,
  });

  int id;
  String title;
  String image;

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}

class CustomerDetail {
  CustomerDetail({
    required this.id,
    required this.user,
    required this.name,
    required this.locality,
    required this.city,
    required this.zipcode,
    required this.state,
  });

  int id;
  int user;
  String name;
  String locality;
  String city;
  int zipcode;
  String state;

  factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
        id: json["id"],
        user: json["user"],
        name: json["name"],
        locality: json["locality"],
        city: json["city"],
        zipcode: json["zipcode"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "name": name,
        "locality": locality,
        "city": city,
        "zipcode": zipcode,
        "state": state,
      };
}
