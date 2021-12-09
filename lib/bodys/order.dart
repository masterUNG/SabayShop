import 'package:flutter/material.dart';
import 'package:sabayshop/widgets/show_title.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ShowTitle(title: 'This is Order'),);
  }
}
