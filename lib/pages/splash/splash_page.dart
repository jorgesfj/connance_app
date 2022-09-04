import 'dart:async';

import 'package:connance_app/pages/login/login_page.dart';
import 'package:connance_app/utils/consts/color_consts.dart';
import 'package:connance_app/utils/routes/navigator_app.dart';
import 'package:connance_app/widgets/patterns/background_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.initState();

    Timer(const Duration(seconds: 3), () => NavigatorApp().goToLogin(context));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final ColorConsts colorConsts = ColorConsts();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const Background1(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [],
                ),
                Text(
                  "CO",
                  style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 60,
                      fontWeight: FontWeight.w200,
                      color: colorConsts.accentGreen),
                ),
                Text(
                  "NN",
                  style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 60,
                      fontWeight: FontWeight.w200,
                      color: colorConsts.accentGreen),
                ),
                Text(
                  "AN",
                  style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 60,
                      fontWeight: FontWeight.w200,
                      color: colorConsts.accentGreen),
                ),
                Text(
                  "CE",
                  style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 60,
                      fontWeight: FontWeight.w200,
                      color: colorConsts.accentGreen),
                )
              ],
            ),
            Positioned(
              left: width * .2,
              bottom: 10,
              child: Text(
                "© connance, all the rights reserved",
                style: TextStyle(
                  color: colorConsts.accentGreen,
                  fontSize: 15
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
