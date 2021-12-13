import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inkoko_app/components/components.dart';
import 'package:inkoko_app/screens/farmer%20pages/orders_list.dart';
import 'package:inkoko_app/screens/farmer%20pages/profile_page_farmer.dart';
import 'package:inkoko_app/screens/farmer%20pages/mainpage_farmer.dart';

class FarmerPages extends StatefulWidget {
  const FarmerPages({Key? key}) : super(key: key);

  @override
  State<FarmerPages> createState() => _FarmerPagesState();
}

class _FarmerPagesState extends State<FarmerPages> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomepageFarmer(),
    OrderList(),
    ProfileFarmer()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: DotNavigationBar(
          duration: Duration(milliseconds: 500),
          margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          backgroundColor: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE0E0E0),
              spreadRadius: 1.2,
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home_outlined),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.category_outlined),
            ),
            DotNavigationBarItem(icon: Icon(Icons.person))
          ],
        ),
      ),
      extendBody: true,
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
