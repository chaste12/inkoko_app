import 'package:flutter/material.dart';

class LoginModel {
  @required
  final String email;
  @required
  final String password;

  const LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }
}

class SignupModel {
  @required
  final String name;

  @required
  final String email;

  @required
  final String role;

  @required
  final String password;

  @required
  final String passwordConfirmation;

  const SignupModel(
      {required this.name,
      required this.email,
      required this.role,
      required this.password,
      required this.passwordConfirmation});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
        name: json['name'],
        email: json['email'],
        role: json['role'],
        password: json['password'],
        passwordConfirmation: json['passwordConfirmation']);
  }
}

class FiliteredEggsModel {
  @required
  final String title;
  @required
  final String quantity;
  @required
  final String price;
  @required
  final String mQuantity;
  @required
  final String description;

  const FiliteredEggsModel(
      {required this.title,
      required this.quantity,
      required this.price,
      required this.mQuantity,
      required this.description});

  factory FiliteredEggsModel.fromJson(Map<String, dynamic> json) {
    return FiliteredEggsModel(
      title: json['title'],
      quantity: json['quantity'],
      price: json['price'],
      mQuantity: json['mQuantity'],
      description: json['description'],
    );
  }
}
