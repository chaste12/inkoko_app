import 'package:flutter/material.dart';
import 'package:inkoko_app/add_general_eggs.dart';
import 'package:inkoko_app/screens/Homepage_farmer.dart';
import 'package:inkoko_app/screens/login_as.dart';
import 'package:inkoko_app/screens/login_customer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const FirstTimePage(),
    );
  }
}
