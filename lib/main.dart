import 'package:flutter/material.dart';
import 'screens/games.dart';
import 'screens/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    Widget mainScreen = _page == 0 ? Games() : Profile();
    return MaterialApp(
      title: 'Flagger',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Flagger'),
          actions: [
            InkWell(
              onTap: () {},
              child: Icon(Icons.settings),
            ),
            SizedBox(width: 30)
          ],
        ),
        body: SafeArea(child: mainScreen),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (value) {
            setState(() => _page = value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Play'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
