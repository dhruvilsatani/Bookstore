// To parse this JSON data, do
//
//     final cart_total = cart_totalFromJson(jsonString);

import 'dart:convert';

List<Cart_total?>? cart_totalFromJson(String str) => json.decode(str) == null
    ? []
    : List<Cart_total?>.from(
        json.decode(str)!.map((x) => Cart_total.fromJson(x)));

String cart_totalToJson(List<Cart_total?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Cart_total {
  Cart_total({
    this.numOfQuantity,
    this.grandTotal,
  });

  int? numOfQuantity;
  int? grandTotal;

  factory Cart_total.fromJson(Map<String, dynamic> json) => Cart_total(
        numOfQuantity: json["num_of_quantity"],
        grandTotal: json["grand_total"],
      );

  Map<String, dynamic> toJson() => {
        "num_of_quantity": numOfQuantity,
        "grand_total": grandTotal,
      };
}
