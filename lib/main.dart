import 'package:flutter/material.dart';
import 'package:sabayshop/states/authen.dart';
import 'package:sabayshop/states/create_account.dart';
import 'package:sabayshop/states/my_service.dart';
import 'package:sabayshop/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  MyConstant.routeAuthen: (BuildContext context) => const Authen(),
  MyConstant.routeCreateAccount: (BuildContext context) =>
      const CreateAccount(),
  MyConstant.routeMyService: (BuildContext context) => const MyService(),
};

String? firstState;

void main() {
  firstState = MyConstant.routeAuthen;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: firstState,
    );
  }
}
