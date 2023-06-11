// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.numOfQuantity,
    required this.grandTotal,
  });

  int numOfQuantity;
  int grandTotal;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        numOfQuantity: json["num_of_quantity"],
        grandTotal: json["grand_total"],
      );

  Map<String, dynamic> toJson() => {
        "num_of_quantity": numOfQuantity,
        "grand_total": grandTotal,
      };
}
