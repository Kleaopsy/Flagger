import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';

void main() => runApp(const ScreenSettings());

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Settings'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: const SafeArea(
          child: Text('Settings'),
        ),
      ),
    );
  }
}
