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

  // factory Products.fromJson(Map<String, dynamic> map) {
  //   return Products(
  //       title: map['title'],
  //       availableQuantity: map['available_quantity'],
  //       price: map['price'],
  //       minimumQuantity: map['minimum_quantity'],
  //       description: map['comment']);
  // }
}

final product = [
  Products(
      title: "assets/images/3.jpg",
      availableQuantity: "Eggs",
      price: "1400",
      minimumQuantity: "Fablab Eggs",
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam debitis assumenda aliquid sit natus nam quaerat incidunt quas neque aut accusantium optio perferendis, possimus praesentium molestiae officia saepe temporibus enim!.'),
  Products(
      title: "assets/images/istockphoto-157375734-170667a.jpg",
      availableQuantity: "Chicks",
      price: "3400",
      minimumQuantity: "Ella farmers",
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam debitis assumenda aliquid sit natus nam quaerat incidunt quas neque aut accusantium optio perferendis, possimus praesentium molestiae officia saepe temporibus enim!.'),
  Products(
      title: "assets/images/katherine-chase-BzF1XBy5xOc-unsplash.jpg",
      availableQuantity: "Eggs",
      price: "5400",
      minimumQuantity: "Good Eggs",
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam debitis assumenda aliquid sit natus nam quaerat incidunt quas neque aut accusantium optio perferendis, possimus praesentium molestiae officia saepe temporibus enim!.'),
  Products(
      title: "assets/images/obie-fernandez-KMDXqrESUuw-unsplash.jpg",
      availableQuantity: "Chickens",
      price: "1400",
      minimumQuantity: "Aquila Farmers",
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam debitis assumenda aliquid sit natus nam quaerat incidunt quas neque aut accusantium optio perferendis, possimus praesentium molestiae officia saepe temporibus enim!.'),
  Products(
      title: "assets/images/jk-sloan-9zLa37VNL38-unsplash.jpg",
      availableQuantity: "Chicken meat",
      price: "2800",
      minimumQuantity: "Sera butchery",
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam debitis assumenda aliquid sit natus nam quaerat incidunt quas neque aut accusantium optio perferendis, possimus praesentium molestiae officia saepe temporibus enim!.'),
];
