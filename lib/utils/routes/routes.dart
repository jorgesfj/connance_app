import 'package:connance_app/pages/home/home_page.dart';
import 'package:connance_app/pages/login/login_page.dart';
import 'package:connance_app/pages/login/register_page.dart';
import 'package:flutter/material.dart';

class Routes {

  Map<String, WidgetBuilder> routes = {
    '/login': (BuildContext context) => const LoginPage(),
    '/register': (BuildContext context) => const RegisterPage(),
    '/homePage': (BuildContext context) => const HomePage(),
  };
}