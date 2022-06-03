import 'package:flutter/material.dart';

const List<Color> lightColorPalatte = [
  Color.fromARGB(255, 236, 228, 179),
  Color.fromARGB(255, 62, 187, 75),
  Color.fromRGBO(237, 237, 237, 1),
  Color.fromARGB(255, 218, 0, 55),
];

List<Color> getLightColorPalatte() => lightColorPalatte;
AssetImage getBackgroundImage() =>
    const AssetImage('assets/images/wallpaper.png');

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightColorPalatte[0],
    colorScheme: const ColorScheme.light(),
    fontFamily: 'Verdana',
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorPalatte[1],
    ),
  );
}
