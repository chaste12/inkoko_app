import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Products {
  int id;
  String title;
  String availableQuantity;
  String price;
  int minimumQuantity;
  String description;

  Products(
      {required this.id,
      required this.title,
      required this.availableQuantity,
      required this.price,
      required this.minimumQuantity,
      required this.description});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        title: json['title'],
        availableQuantity: json['available_quantity'],
        price: json['price'],
        minimumQuantity: int.parse(json['minimum_quantity']),
        description: json['comment']);
  }
}

class Bisibility {
  var allProducts = true;
  var allEggs = false;

  Bisibility({required this.allProducts, required this.allEggs});
}
