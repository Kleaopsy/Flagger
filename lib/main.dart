import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flagger/screens/games.dart';
import 'package:flagger/screens/profile.dart';
import 'package:flagger/screens/settings.dart';
import 'settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: getBackgroundImage(), fit: BoxFit.cover)),
            child: const SingleChildScrollView(
              child: MainScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: const AssetImage('assets/images/Logo.png'),
            width: screenWidth * 3 / 6,
          ),
          TextButton(
            onPressed: () =>
                Navigator.push(context, CustomPageRoute(child: const Games())),
            child: Container(
              width: screenWidth - 30,
              height: 100,
              decoration: BoxDecoration(
                color: lightColorPalatte[1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Play',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(
                context, CustomPageRoute(child: const Profile())),
            child: Container(
              width: screenWidth - 30,
              height: 100,
              decoration: BoxDecoration(
                color: lightColorPalatte[1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(
                context, CustomPageRoute(child: const Settings())),
            child: Container(
              width: screenWidth - 30,
              height: 100,
              decoration: BoxDecoration(
                color: lightColorPalatte[1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: Container(
              width: screenWidth - 30,
              height: 100,
              decoration: BoxDecoration(
                color: lightColorPalatte[1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Exit',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
