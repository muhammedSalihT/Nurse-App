import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);

class ThemeConstents {
  static Color appPrimeryColor = const Color.fromARGB(230, 0, 160, 222);
  static Color appBodyColor = Colors.white;
  static Color appBodyBlack = Colors.black;

  static List<Color> appGradientColor = [
    const Color(0xff00A0DE),
    const Color(0xffFFFFFF)
  ];
}
