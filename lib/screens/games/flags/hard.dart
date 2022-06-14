// ignore_for_file: file_names

import 'dart:math';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

void main() => runApp(Hard());

class Question {
  ImageProvider questionImage;
  String answer;
  Question(this.questionImage, this.answer);
}

List<Question> questions = [];
List<Color> colorPalette = getLightColorPalatte();

class Hard extends StatelessWidget {
  Hard({Key? key}) : super(key: key);
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<firebase_storage.ListResult> listImages() async => await storage.ref('Flags/Hard').listAll();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Hard'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                color: colorPalette[0],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: FutureBuilder(
                    future: listImages(),
                    builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                        if (questions.length != snapshot.data!.items.length) {
                          questions.clear();
                          String fileName = "";
                          for (int i = 0; i < snapshot.data!.items.length; i++) {
                            fileName = "";
                            for (int i2 = 0; i2 < snapshot.data!.items[i].name.length - 4; i2++) {
                              fileName += (snapshot.data!.items[i].name[i2] == '_') ? ' ' : snapshot.data!.items[i].name[i2];
                            }

                            questions.add(Question(FirebaseImage('gs://flagger-3ec66.appspot.com/Flags/Hard/' + snapshot.data!.items[i].name), fileName));
                          }
                        }
                        return const QuestionWidget();
                      } else if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return const Text('Error');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  Random rndNum = Random();
  int trueAnswer = 0, wrongAnswers = 0, buttonNum = 0, buttonCount = 4;
  List<String> answers = [];
  bool uniqueQuestion = true;
  int questionCap = 25, userAt = 1;
  ImageProvider? flag;

  List<bool> userAnswers = [];
  List<int> oldQuestions = [];

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
    //be Sure Wont be same Question
    do {
      uniqueQuestion = true;
      trueAnswer = rndNum.nextInt(questions.length);

      for (int i = 0; i < oldQuestions.length; i++) {
        if (oldQuestions[i] == trueAnswer) {
          uniqueQuestion = false;
        }
      }
    } while (!uniqueQuestion);
    oldQuestions.add(trueAnswer);

    //generete Question
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

    //Screen
    if (userAt > questionCap) {
      int trueCount = 0, falseCount = 0;
      for (int i = 0; i < questionCap; i++) {
        trueCount = userAnswers[i] ? trueCount + 1 : trueCount;
        falseCount = !userAnswers[i] ? falseCount + 1 : falseCount;
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('True: '),
              Text(trueCount.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('False: '),
              Text(falseCount.toString()),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userAt.toString()),
              const Text('/'),
              Text(questionCap.toString()),
            ],
          ),
          SingleChildScrollView(
            child: Image(
              width: MediaQuery.of(context).size.width - 100,
              image: flag as ImageProvider,
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: button1,
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2 - 35,
                  height: (MediaQuery.of(context).size.width - 60) / 2 - 35,
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
              const SizedBox(width: 5),
              TextButton(
                onPressed: button2,
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2 - 35,
                  height: (MediaQuery.of(context).size.width - 60) / 2 - 35,
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
                  width: (MediaQuery.of(context).size.width - 60) / 2 - 35,
                  height: (MediaQuery.of(context).size.width - 60) / 2 - 35,
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
              const SizedBox(width: 5),
              TextButton(
                onPressed: button4,
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2 - 35,
                  height: (MediaQuery.of(context).size.width - 60) / 2 - 35,
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
      );
    }
  }
}
