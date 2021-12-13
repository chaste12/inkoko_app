import 'package:flutter/material.dart';
import 'package:inkoko_app/components/components.dart';

class ExploreCards extends StatelessWidget {
  const ExploreCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore by category",
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
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cat.length,
            itemBuilder: (context, index) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width * 0.70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(cat[index].image),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cat[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



// Container(
//                       width: MediaQuery.of(context).size.width / 2.5,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0xFFE0E0E0),
//                             spreadRadius: 1.2,
//                             blurRadius: 4,
//                             offset: Offset(0, 0),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               image: DecorationImage(
//                                   image: AssetImage("assets/images/3.jpg"),
//                                   fit: BoxFit.cover),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Eggs",
//                                   style: TextStyle(
//                                     color: Colors.grey[800],
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 Text(
//                                   "1400",
//                                   style: TextStyle(
//                                     color: Colors.red,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 Row(children: [
//                                   SvgPicture.asset(
//                                     "assets/icons/primary/briefcase.svg",
//                                     color: Colors.red,
//                                   ),
//                                   Text(
//                                     "Gashora eggs",
//                                     style: TextStyle(
//                                       color: Colors.grey[800],
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                 ]),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 10.0),
//                                   child: Container(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20),
//                                     width: MediaQuery.of(context).size.width,
//                                     height: 30,
//                                     decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         "Order now",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       )),
