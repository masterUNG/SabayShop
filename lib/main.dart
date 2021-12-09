import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sabayshop/states/authen.dart';
import 'package:sabayshop/states/create_account.dart';
import 'package:sabayshop/states/for_admin.dart';
import 'package:sabayshop/states/my_service.dart';
import 'package:sabayshop/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  MyConstant.routeAuthen: (BuildContext context) => const Authen(),
  MyConstant.routeCreateAccount: (BuildContext context) =>
      const CreateAccount(),
  MyConstant.routeMyService: (BuildContext context) => const MyService(),
  MyConstant.routeForAdmin:(BuildContext context)=> const ForAdmin(),
};

String? firstState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    // print('Firebase Initial Success');
    firstState = MyConstant.routeAuthen;
    runApp(const MyApp());
  });
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
