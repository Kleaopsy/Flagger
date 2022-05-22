import 'package:flagger/screens/profile.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'screens/games.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;
  String _pageTitle = 'Flagger';
  Widget _mainScreenWidged = const Games();

  void _changeMainScreen(int index) {
    _page = index;
    if (_page == 0) {
      setState(() {
        _pageTitle = 'Flagger';
        _mainScreenWidged = const Games();
      });
    } else {
      setState(() {
        _pageTitle = 'Profile';
        _mainScreenWidged = const Profile();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(_pageTitle),
        ),
        body: SafeArea(child: _mainScreenWidged),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: _changeMainScreen,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.gamepad),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
