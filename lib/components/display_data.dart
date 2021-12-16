import 'package:flutter/material.dart';

class CustomerProducts {
  @required
  String title;

  @required
  String availableQuantity;

  @required
  String price;
  @required
  String minimumQuantity;

  @required
  String description;

  CustomerProducts({
    required this.title,
    required this.availableQuantity,
    required this.price,
    required this.minimumQuantity,
    required this.description,
  });

  factory CustomerProducts.fromJson(Map<String, dynamic> map) {
    return CustomerProducts(
        title: map['title'],
        availableQuantity: map['available_quantity'],
        price: map['price'],
        minimumQuantity: map['minimum_quantity'],
        description: map['comment']);
  }
}

// class Product {
//   String title;
//   String availableQuantity;
//   String price;
//   String minimumQuantity;
//   String description;

//   Product.fromJson(Map<String, dynamic> map)
//       : title = map['title'] ?? "",
//         availableQuantity = map['available_quantity'],
//         price = map['price'] ?? "",
//         minimumQuantity = map['minimum_quantity'],
//         description = map['comment'];
// }