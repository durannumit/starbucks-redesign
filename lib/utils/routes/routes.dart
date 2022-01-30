import 'package:flutter/material.dart';
import 'package:starbucks_redesign/pages/detail/detail_screen.dart';
import 'package:starbucks_redesign/pages/home/home_screen.dart';
import 'package:starbucks_redesign/pages/login/login_screen.dart';
import 'package:starbucks_redesign/pages/splash_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String detail = '/detail';

  //static const String home = '/home';
  //static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    login: (BuildContext context) => const LoginScreen(),
    home: (BuildContext context) => const HomeScreen(),
    detail: (BuildContext context) => const DetailScreen(),

    // home: (BuildContext context) => HomeScreen(),
    //detail: (BuildContext context) => DetailScreen(),
  };
}
