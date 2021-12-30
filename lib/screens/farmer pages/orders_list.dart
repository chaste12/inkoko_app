import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        child: SizedBox(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset("assets/icons/primary/view-list.svg",
                    width: 60, color: Colors.red),
                Text(
                  "No orders yet",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
