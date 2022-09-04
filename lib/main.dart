import 'package:connance_app/pages/splash/splash_page.dart';
import 'package:connance_app/utils/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'utils/routes/routes.dart';
void main() => runApp(const App());


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return const MyApp();
        }

        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        );
      });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      routes: Routes().routes,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: ColorConsts().darkGreen
          )
        ),
      )
    );
  }
}