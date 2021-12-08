import 'package:flutter/material.dart';

class MyConstant {
  // filed
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeMyService = '/myService';
  static String appName = 'Sabay Shop';

  // Method
  TextStyle h1Style() => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3tyle() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
}
