import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inkoko_app/screens/customer%20pages/customer.dart';
import 'package:inkoko_app/screens/customer%20pages/homepage_customer.dart.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/primary/check.svg",
                      color: Colors.red,
                      width: 100,
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Thank you for your order!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Your order has been submitted successfully and will be processed as soon as possible. You will be receiving an SMS shortly with confirmation of your order. You can now make sure you make note of your order number, which is 1I2VXWOATBLWK8GGYou will be receiving an SMS shortly with confirmation of your order. You can now:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerPages()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            "Go back to shopping",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
