// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category?>? categoryFromJson(String str) => json.decode(str) == null
    ? []
    : List<Category?>.from(json.decode(str)!.map((x) => Category.fromJson(x)));

String categoryToJson(List<Category?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Category {
  Category({
    this.id,
    this.title,
    this.image,
  });

  int? id;
  String? title;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
