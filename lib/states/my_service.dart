import 'package:flutter/material.dart';
import 'package:sabayshop/bodys/cart.dart';
import 'package:sabayshop/bodys/goods.dart';
import 'package:sabayshop/bodys/order.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  List<String> titles = [
    'Goods',
    'Cart',
    'Order',
  ];
  List<IconData> icons = [
    Icons.filter_1,
    Icons.filter_2,
    Icons.filter_3,
  ];
  List<Widget> widgets = [
    const Goods(),
    const Cart(),
    const Order(),
  ];

  int indexBody = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpNavigationBar();
  }

  void setUpNavigationBar() {
    for (var i = 0; i < titles.length; i++) {
      bottomNavigationBarItems.add(
        BottomNavigationBarItem(
          icon: Icon(icons[i]),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[indexBody]),
      ),
      body: widgets[indexBody],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: indexBody,
        onTap: (value) {
          setState(() {
            indexBody = value;
          });
        },
      ),
    );
  }
}
