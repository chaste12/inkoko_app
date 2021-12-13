import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inkoko_app/components/account_model.dart';
import 'package:inkoko_app/screens/customer%20pages/homepage_customer.dart.dart';
import 'package:inkoko_app/screens/farmer%20pages/Homepage_farmer.dart';
import 'package:http/http.dart' as http;

class LoginCustomer extends StatefulWidget {
  const LoginCustomer({Key? key}) : super(key: key);

  @override
  _LoginCustomerState createState() => _LoginCustomerState();
}

class _LoginCustomerState extends State<LoginCustomer> {
  var visible = false;
  var _loginDetails = const LoginModel(email: "", password: "");
  final _form = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  Future<void> loginButton_handler() async {
    _form.currentState!.validate();
    _form.currentState!.save();

    setState(() {
      visible = true;
    });
    if (_loginDetails.email != '' && _loginDetails.password != '') {
      var response = await http.post(
          Uri.https('inkoko-app-endpoints.herokuapp.com', '/api/login',
              {'q': '{http}'}),
          body: ({
            "email": _loginDetails.email,
            "password": _loginDetails.password
          }));
      if (response.statusCode == 200) {
        setState(() {
          visible = false;
        });
        var user = jsonDecode(response.body);
        if (user["token"] != '' || user["token"] != null) {
          if (user["user"]["role"] == "farmer") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FarmerPages()));
          } else if (user["user"]["role"] == "customer") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CustomerPages()));
          }
        } else {
          setState(() {
            visible = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid Email or Password")));
        }
      } else {
        setState(() {
          visible = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Invalid Email or Password")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pattern2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 200.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _form,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Email",
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
                                _loginDetails = LoginModel(
                                    email: value.toString(),
                                    password: _loginDetails.password);
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter password",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onFieldSubmitted: (_) {
                                loginButton_handler();
                              },
                              onSaved: (value) {
                                _loginDetails = LoginModel(
                                    email: _loginDetails.email,
                                    password: value.toString());
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: loginButton_handler,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                "Login",
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
                      ),
                      Text(
                        "Forgot your password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Visibility(
                          visible: visible,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: CircularProgressIndicator())),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
