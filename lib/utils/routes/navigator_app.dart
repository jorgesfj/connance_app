import 'package:flutter/material.dart';

class NavigatorApp {

  void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void goToRegister(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/register');
  }

  void goToHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/homePage');
  }

}