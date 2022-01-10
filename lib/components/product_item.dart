import 'package:inkoko_app/components/components.dart';

class ProductItem {
  int quantity;
  final Products? product;

  ProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }

  // void add() {}

  // void substract() {}
}
