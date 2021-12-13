// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inkoko_app/components/account_model.dart';
import 'package:http/http.dart' as http;
import 'package:inkoko_app/screens/customer%20pages/login_customer.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var visible = false;
  var _signupDetails = const SignupModel(
      name: "", email: "", role: "", password: "", passwordConfirmation: "");
  final _form = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  Future<void> signupButton_handler() async {
    _form.currentState!.validate();
    _form.currentState!.save();

    setState(() {
      visible = true;
    });
    if (_signupDetails.password == _signupDetails.passwordConfirmation) {
      var response = await http.post(
          Uri.https('inkoko-app-endpoints.herokuapp.com', '/api/users',
              {'q': '{http}'}),
          body: ({
            "name": _signupDetails.name,
            "email": _signupDetails.email,
            "role": _signupDetails.role,
            "password": _signupDetails.password,
            "password_confirmation": _signupDetails.passwordConfirmation
          }));
      if (response.statusCode == 200) {
        setState(() {
          visible = false;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginCustomer()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(vertical: 150.0),
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter names",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: value.toString(),
                                  email: _signupDetails.email,
                                  role: _signupDetails.role,
                                  password: _signupDetails.password,
                                  passwordConfirmation:
                                      _signupDetails.passwordConfirmation,
                                );
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter email",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: _signupDetails.name,
                                  email: value.toString(),
                                  role: _signupDetails.role,
                                  password: _signupDetails.password,
                                  passwordConfirmation:
                                      _signupDetails.passwordConfirmation,
                                );
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter role",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: _signupDetails.name,
                                  email: _signupDetails.email,
                                  role: value.toString(),
                                  password: _signupDetails.password,
                                  passwordConfirmation:
                                      _signupDetails.passwordConfirmation,
                                );
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
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: _signupDetails.name,
                                  email: _signupDetails.email,
                                  role: _signupDetails.role,
                                  password: value.toString(),
                                  passwordConfirmation:
                                      _signupDetails.passwordConfirmation,
                                );
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
                                hintText: "Comfirm password",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onFieldSubmitted: (_) {
                                signupButton_handler();
                              },
                              onSaved: (value) {
                                _signupDetails = SignupModel(
                                  name: _signupDetails.name,
                                  email: _signupDetails.email,
                                  role: _signupDetails.role,
                                  password: _signupDetails.password,
                                  passwordConfirmation: value.toString(),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: signupButton_handler,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                "Sign up",
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
