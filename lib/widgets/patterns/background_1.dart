import 'package:connance_app/utils/consts/color_consts.dart';
import 'package:flutter/material.dart';

class Background1 extends StatelessWidget {
  const Background1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      color: ColorConsts().darkGreen,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Positioned(left: -20, top: -20, child: editedContainer()),
          Positioned(left: 170, top: -40, child: editedContainer()),
          Positioned(left: 80, top: 40, child: editedContainer()),
          Positioned(left: 230, top: 50, child: editedContainer()),
          Positioned(left: 20, top: 130, child: editedContainer()),
          Positioned(left: 150, top: 140, child: editedContainer()),
        ],
      ),
    );
  }

  Widget editedContainer() {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          color: ColorConsts().accentGreen,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
