import 'package:flutter/material.dart';

const List<Color> darkColorPalatte = [
  Color.fromARGB(255, 23, 23, 23),
  Color.fromARGB(255, 68, 68, 68),
  Color.fromARGB(255, 218, 0, 55),
  Color.fromARGB(255, 237, 237, 237)
];

List<Color> getDarkColorPalatte() => darkColorPalatte;

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkColorPalatte[1],
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorPalatte[0],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorPalatte[0],
      unselectedItemColor: darkColorPalatte[3],
      selectedItemColor: darkColorPalatte[2],
    ),
  );
}
