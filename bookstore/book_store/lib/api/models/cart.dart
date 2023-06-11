// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart?> cartFromJson(String str) => json.decode(str) == null
    ? []
    : List<Cart?>.from(json.decode(str)!.map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart?> data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Cart {
  Cart({
    this.id,
    this.user,
    this.book,
    this.bookDetail,
    this.quantity,
    this.price,
  });

  int? id;
  int? user;
  int? book;
  BookDetail? bookDetail;
  int? quantity;
  int? price;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        user: json["user"],
        book: json["book"],
        bookDetail: BookDetail.fromJson(json["book_detail"]),
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "book": book,
        "book_detail": bookDetail!.toJson(),
        "quantity": quantity,
        "price": price,
      };
}

class BookDetail {
  BookDetail({
    this.id,
    this.name,
    this.category,
    this.description,
    this.sellingPrice,
    this.discountedPrice,
    this.author,
    this.publisher,
    this.image,
  });

  int? id;
  String? name;
  int? category;
  String? description;
  int? sellingPrice;
  int? discountedPrice;
  int? author;
  int? publisher;
  String? image;

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        description: json["description"],
        sellingPrice: json["selling_price"],
        discountedPrice: json["discounted_price"],
        author: json["author"],
        publisher: json["publisher"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "selling_price": sellingPrice,
        "discounted_price": discountedPrice,
        "author": author,
        "publisher": publisher,
        "image": image,
      };
}
