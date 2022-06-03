import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';

void main() => runApp(const Easy());

class Question {
  AssetImage questionImage;
  String answer;
  Question(this.questionImage, this.answer);
}

List<Question> questions = [
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Argentina.png'),
      'Argentina'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Australia.png'),
      'Australia'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Austria.png'),
      'Austria'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Belgium.png'),
      'Belgium'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Brazil.png'),
      'Brazil'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Canada.png'),
      'Canada'),
  Question(
      const AssetImage('assets/images/flags/easy/Flag_of_China.png'), 'China'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_France.png'),
      'France'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Germany.png'),
      'Germany'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Greece.png'),
      'Greece'),
  Question(
      const AssetImage('assets/images/flags/easy/Flag_of_India.png'), 'India'),
  Question(
      const AssetImage('assets/images/flags/easy/Flag_of_Italy.png'), 'Italy'),
  Question(
      const AssetImage('assets/images/flags/easy/Flag_of_Japan.png'), 'Japan'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Netherlands.png'),
      'Netherlands'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Russia.png'),
      'Russia'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_South_Korea.png'),
      'South Korea'),
  Question(
      const AssetImage('assets/images/flags/easy/Flag_of_Spain.png'), 'Spain'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Switzerland.png'),
      'Switzerland'),
  Question(const AssetImage('assets/images/flags/easy/Flag_of_Turkey.png'),
      'Turkey'),
  Question(
      const AssetImage('assets/images/flags/easy/Flag_of_United_Kingdom.png'),
      'UK'),
  Question(
      const AssetImage('assets/images/flags/easy/Flag_of_United_States.png'),
      'USA'),
];

List<Color> colorPalette = getLightColorPalatte();

class Easy extends StatefulWidget {
  const Easy({Key? key}) : super(key: key);

  @override
  State<Easy> createState() => _EasyState();
}

class _EasyState extends State<Easy> {
  Random rndNum = Random();
  int trueAnswer = 0, wrongAnswers = 0, buttonNum = 0, buttonCount = 4;
  List<String> answers = [];
  late AssetImage flag;

  int questionCap = 10, userAt = 1;
  List<bool> userAnswers = [];

  void button1() => setState(() {
        if (buttonNum == 0) {
          userAnswers.add(true);
        } else {
          userAnswers.add(false);
        }
        userAt++;
        answers.clear();
      });
  void button2() => setState(() {
        if (buttonNum == 1) {
          userAnswers.add(true);
        } else {
          userAnswers.add(false);
        }
        userAt++;
        answers.clear();
      });
  void button3() => setState(() {
        if (buttonNum == 2) {
          userAnswers.add(true);
        } else {
          userAnswers.add(false);
        }
        userAt++;
        answers.clear();
      });
  void button4() => setState(() {
        if (buttonNum == 3) {
          userAnswers.add(true);
        } else {
          userAnswers.add(false);
        }
        userAt++;
        answers.clear();
      });

  @override
  Widget build(BuildContext context) {
    if (userAt > questionCap) {
      int trueCount = 0, falseCount = 0;
      for (int i = 0; i < userAnswers.length; i++) {
        if (userAnswers[i] == true) {
          trueCount++;
        } else {
          falseCount++;
        }
      }

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeClass.lightTheme,
        themeMode: ThemeMode.light,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Easy'),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('True: '),
                      Text(trueCount.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('False: '),
                      Text(falseCount.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
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
            if (questions[wrongAnswers].answer ==
                questions[trueAnswer].answer) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(userAt.toString()),
                          const Text('/'),
                          Text(questionCap.toString()),
                        ],
                      ),
                      Image(
                        width: MediaQuery.of(context).size.width - 100,
                        image: flag,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: button1,
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
                            onPressed: button2,
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
                            onPressed: button3,
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
                            onPressed: button4,
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
}
