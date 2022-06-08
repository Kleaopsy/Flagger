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

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  CustomPageRoute({
    required this.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}
