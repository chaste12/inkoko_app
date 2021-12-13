import 'package:flutter/material.dart';
import 'package:inkoko_app/add_general_eggs.dart';
import 'package:inkoko_app/components/components.dart';
import 'package:inkoko_app/screens/details_page_farmer.dart';

class HomepageFarmer extends StatefulWidget {
  const HomepageFarmer({Key? key}) : super(key: key);

  @override
  _HomepageFarmerState createState() => _HomepageFarmerState();
}

class _HomepageFarmerState extends State<HomepageFarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 20),
                        Text("Choose eggs",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/fried-egg.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Text("Regular Eggs",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                            ),
                            Divider(height: 70),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/chicken.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Text("Filitilized Eggs",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    )
                  ],
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              backgroundColor: Colors.grey[200],
            );
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your products",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            height: 6,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: (200 / 265),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: product.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsFarmer(prod: product[index])));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFE0E0E0),
                                  spreadRadius: 1.2,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: product[index].image,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(product[index].image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product[index].productName,
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        product[index].amount,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Details",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
