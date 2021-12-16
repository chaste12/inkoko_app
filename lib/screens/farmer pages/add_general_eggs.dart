import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inkoko_app/components/account_model.dart';
import 'package:http/http.dart' as http;
import 'package:inkoko_app/screens/farmer%20pages/Homepage_farmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralEggs extends StatefulWidget {
  const GeneralEggs({Key? key}) : super(key: key);

  @override
  _GeneralEggsState createState() => _GeneralEggsState();
}

class _GeneralEggsState extends State<GeneralEggs> {
  String token = '';

  @override
  void initState() {
    getCredentials();
  }

  void getCredentials() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token")!;
    });
  }

  var visible = false;
  var _fEggsDetails = const FiliteredEggsModel(
      title: "", quantity: "", price: "", mQuantity: "", description: "");
  final _form = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names

  // Future<void> data() async {
  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.get(
  //     Uri.https('inkoko-app-endpoints.herokuapp.com', '/api/filter/eggs',
  //         {'q': '{http}'}),
  //   );
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body) as Map<String, dynamic>;

  //     var title = [data["eggs"]["title"]];

  //     print(title);
  //   }
  // }

  Future<void> filiteredEggsButton_handler(token) async {
    _form.currentState!.validate();
    _form.currentState!.save();

    setState(() {
      visible = true;
    });
    if (_fEggsDetails.title != '' &&
        _fEggsDetails.quantity != '' &&
        _fEggsDetails.price != '' &&
        _fEggsDetails.mQuantity != '' &&
        _fEggsDetails.description != '') {
      var response = await http.post(
          Uri.https('inkoko-app-endpoints.herokuapp.com', '/api/filter/eggs',
              {'q': '{http}'}),
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: ({
            "title": _fEggsDetails.title,
            "available_quantity": _fEggsDetails.quantity,
            "price": _fEggsDetails.price,
            "minimum_quantity": _fEggsDetails.mQuantity,
            "comment": _fEggsDetails.description,
          }));
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FarmerPages()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset("assets/icons/primary/chevron-left.svg",
              color: Colors.grey[800], width: 30),
        ),
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          "assets/images/logo.png",
          width: 60,
        ),
        actions: [
          SvgPicture.asset(
            "assets/icons/primary/search.svg",
            color: Colors.red,
            width: 30,
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Text("Add filitered eggs",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter title",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Insert a value";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _fEggsDetails = FiliteredEggsModel(
                            title: value.toString(),
                            quantity: _fEggsDetails.quantity,
                            price: _fEggsDetails.price,
                            mQuantity: _fEggsDetails.mQuantity,
                            description: _fEggsDetails.description,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter quantity",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Insert a value";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _fEggsDetails = FiliteredEggsModel(
                            title: _fEggsDetails.title,
                            quantity: value.toString(),
                            price: _fEggsDetails.price,
                            mQuantity: _fEggsDetails.mQuantity,
                            description: _fEggsDetails.description,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter price",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Insert a value";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _fEggsDetails = FiliteredEggsModel(
                            title: _fEggsDetails.title,
                            quantity: _fEggsDetails.quantity,
                            price: value.toString(),
                            mQuantity: _fEggsDetails.mQuantity,
                            description: _fEggsDetails.description,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter minimum quantity",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Insert a value";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _fEggsDetails = FiliteredEggsModel(
                            title: _fEggsDetails.title,
                            quantity: _fEggsDetails.quantity,
                            price: _fEggsDetails.price,
                            mQuantity: value.toString(),
                            description: _fEggsDetails.description,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter description",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Insert a value";
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          filiteredEggsButton_handler(token);
                        },
                        onSaved: (value) {
                          _fEggsDetails = FiliteredEggsModel(
                            title: _fEggsDetails.title,
                            quantity: _fEggsDetails.quantity,
                            price: _fEggsDetails.price,
                            mQuantity: _fEggsDetails.mQuantity,
                            description: value.toString(),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      filiteredEggsButton_handler(token);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
