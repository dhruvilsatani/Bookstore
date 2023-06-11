// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

List<Offer> offerFromJson(String str) =>
    List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offerToJson(List<Offer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
  Offer({
    required this.id,
    required this.image,
    required this.book,
    required this.bookDetail,
  });

  int id;
  String image;
  int book;
  BookDetail bookDetail;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        image: json["image"],
        book: json["book"],
        bookDetail: BookDetail.fromJson(json["book_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "book": book,
        "book_detail": bookDetail.toJson(),
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
