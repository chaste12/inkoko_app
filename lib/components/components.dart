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
  String image;
  String productName;
  String amount;
  String companyName;

  Products(
      {required this.image,
      required this.productName,
      required this.amount,
      required this.companyName});
}

final product = [
  Products(
      image: "assets/images/3.jpg",
      productName: "Eggs",
      amount: "1400",
      companyName: "Gasogi Eggs"),
  Products(
      image: "assets/images/istockphoto-157375734-170667a.jpg",
      productName: "Chicks",
      amount: "1400",
      companyName: "Ella farmers"),
  Products(
      image: "assets/images/katherine-chase-BzF1XBy5xOc-unsplash.jpg",
      productName: "Eggs",
      amount: "1400",
      companyName: "Good Eggs"),
  Products(
      image: "assets/images/obie-fernandez-KMDXqrESUuw-unsplash.jpg",
      productName: "Chickens",
      amount: "1400",
      companyName: "Aquila Farmers"),
  Products(
      image: "assets/images/jk-sloan-9zLa37VNL38-unsplash.jpg",
      productName: "Chicken meat",
      amount: "1400",
      companyName: "Sera butchery"),
];
