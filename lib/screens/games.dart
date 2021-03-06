import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flagger/screens/games/flags.dart';

void main() => runApp(const Games());

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<Color> colorPalatte = getLightColorPalatte();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Games'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      CustomPageRoute(child: const Flags()),
                    ),
                    child: Container(
                      width: (screenWidth - 20) / 2 - 2,
                      height: (screenWidth - 20) / 2 - 2,
                      decoration: BoxDecoration(
                        color: colorPalatte[1],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Image(
                              image: FirebaseImage('gs://flagger-3ec66.appspot.com/images/flags_icon.png'),
                            ),
                            const Text(
                              'Flags',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
