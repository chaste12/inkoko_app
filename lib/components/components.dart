import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Cat {
  String image;
  String name;

  Cat({
    required this.image,
    required this.name,
  });
}

final cat = [
  Cat(
    image: "assets/images/katherine-chase-BzF1XBy5xOc-unsplash.jpg",
    name: "Eggs",
  ),
  Cat(
      image: "assets/images/jk-sloan-9zLa37VNL38-unsplash.jpg",
      name: "Chicken meat"),
  Cat(
    image: "assets/images/istockphoto-157375734-170667a.jpg",
    name: "Chicks",
  ),
  Cat(
      image: "assets/images/obie-fernandez-KMDXqrESUuw-unsplash.jpg",
      name: "Chickens"),
];

class Products {
  String title;
  String availableQuantity;
  String price;
  String minimumQuantity;
  String description;

  Products(
      {required this.title,
      required this.availableQuantity,
      required this.price,
      required this.minimumQuantity,
      required this.description});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        title: json['title'],
        availableQuantity: json['available_quantity'],
        price: json['price'],
        minimumQuantity: json['minimum_quantity'],
        description: json['comment']);
  }
}
