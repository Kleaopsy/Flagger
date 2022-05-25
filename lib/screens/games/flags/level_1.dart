import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';

void main() => runApp(const Level1());

class Question {
  AssetImage questionImage;
  String text;
  bool answer;
  Question(this.questionImage, this.text, this.answer);
}

List<Color> colorPalette = getDarkColorPalatte();
List<AssetImage> level1Flags = [
  const AssetImage('assets/images/flags/hun.png'),
  const AssetImage('assets/images/flags/jp.png'),
  const AssetImage('assets/images/flags/pl.png'),
  const AssetImage('assets/images/flags/prc.png'),
  const AssetImage('assets/images/flags/ru.png'),
  const AssetImage('assets/images/flags/tr.png'),
  const AssetImage('assets/images/flags/ua.png'),
];

class Level1 extends StatefulWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Level - 1'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: const SafeArea(
          child: Center(
            child: Game(),
          ),
        ),
      ),
    );
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool gameStarted = false;
  void theGame() {}

  @override
  Widget build(BuildContext context) {
    if (!gameStarted) {
      return TextButton(
        onPressed: () => setState(() {
          gameStarted = true;
          theGame();
        }),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 75,
          child: const Center(
            child: Text(
              'Start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: colorPalette[0],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
