import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';

void main() => runApp(const Level1());

class Question {
  AssetImage questionImage;
  String answer;
  Question(this.questionImage, this.answer);
}

List<Question> questions = [
  Question(const AssetImage('assets/images/flags/hu.png'), 'Hungary'),
  Question(const AssetImage('assets/images/flags/jp.png'), 'Japan'),
  Question(const AssetImage('assets/images/flags/pl.png'), 'Poland'),
  Question(const AssetImage('assets/images/flags/cn.png'), 'China'),
  Question(const AssetImage('assets/images/flags/ru.png'), 'Russia'),
  Question(const AssetImage('assets/images/flags/tr.png'), 'Turkey'),
  Question(const AssetImage('assets/images/flags/ua.png'), 'Ukraine'),
  Question(const AssetImage('assets/images/flags/de.png'), 'Germany'),
  Question(const AssetImage('assets/images/flags/nl.png'), 'Netherlands'),
  Question(const AssetImage('assets/images/flags/fr.png'), 'France'),
];

List<Color> colorPalette = getDarkColorPalatte();

class Level1 extends StatefulWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  Random rndNum = Random();
  int trueAnswer = 0, wrongAnswers = 0, buttonNum = 0, buttonCount = 4;
  List<String> answers = [];
  late AssetImage flag;
  void theGame() {}

  @override
  Widget build(BuildContext context) {
    trueAnswer = rndNum.nextInt(questions.length);
    flag = questions[trueAnswer].questionImage;
    buttonNum = rndNum.nextInt(buttonCount);
    for (int i = 0; i < buttonCount; i++) {
      if (i == buttonNum) {
        answers.add(questions[trueAnswer].answer);
      } else {
        bool unique = true;
        do {
          unique = true;
          wrongAnswers = rndNum.nextInt(questions.length);
          if (questions[wrongAnswers].answer == questions[trueAnswer].answer) {
            unique = false;
          } else {
            for (int j = 0; j < answers.length; j++) {
              if (answers[j] == questions[wrongAnswers].answer) {
                unique = false;
              }
            }
          }
        } while (!unique);
        answers.add(questions[wrongAnswers].answer);
      }
    }

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
        body: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 520,
              decoration: BoxDecoration(
                color: colorPalette[0],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Image(
                      width: MediaQuery.of(context).size.width - 100,
                      image: flag,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: theGame,
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width - 60) / 2 -
                                    50,
                            height: 80,
                            child: Center(
                              child: Text(
                                answers[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorPalette[1],
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        TextButton(
                          onPressed: theGame,
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width - 60) / 2 -
                                    50,
                            height: 80,
                            child: Center(
                              child: Text(
                                answers[1],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorPalette[1],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: theGame,
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width - 60) / 2 -
                                    50,
                            height: 80,
                            child: Center(
                              child: Text(
                                answers[2],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorPalette[1],
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        TextButton(
                          onPressed: theGame,
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width - 60) / 2 -
                                    50,
                            height: 80,
                            child: Center(
                              child: Text(
                                answers[3],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorPalette[1],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
