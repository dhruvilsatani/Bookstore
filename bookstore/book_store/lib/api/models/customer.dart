// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

List<Customer?>? customerFromJson(String str) => json.decode(str) == null
    ? []
    : List<Customer?>.from(json.decode(str)!.map((x) => Customer.fromJson(x)));

String customerToJson(List<Customer?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Customer {
  Customer({
    this.id,
    this.user,
    this.name,
    this.locality,
    this.city,
    this.zipcode,
    this.state,
  });

  int? id;
  int? user;
  String? name;
  String? locality;
  String? city;
  int? zipcode;
  String? state;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
        "locality": locality,
        "city": city,
        "zipcode": zipcode,
        "state": state,
      };
}
