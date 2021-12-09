import 'package:flutter/material.dart';
import 'package:sabayshop/widgets/show_title.dart';


class Goods extends StatefulWidget {
  const Goods({Key? key}) : super(key: key);

  @override
  _GoodsState createState() => _GoodsState();
}

class _GoodsState extends State<Goods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ShowTitle(title: 'This is Goods'),);
  }
}
