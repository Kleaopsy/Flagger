import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';
import 'package:flagger/screens/games/flags.dart';

void main() => runApp(const Games());

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<Color> colorPalatte = getDarkColorPalatte();
  int _games = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (_games == 1) {
      return const Flags();
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => setState(() => _games = 1),
                    child: Container(
                      width: (screenWidth - 20) / 2 - 2,
                      height: (screenWidth - 20) / 2 - 2,
                      decoration: BoxDecoration(
                        color: colorPalatte[0],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('assets/images/flags_icon.png'),
                            ),
                            Text('Flags'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    child: Container(
                      width: (screenWidth - 20) / 2 - 2,
                      height: (screenWidth - 20) / 2 - 2,
                      decoration: BoxDecoration(
                        color: colorPalatte[0],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('assets/images/flags/jp.png'),
                            ),
                            Text('Japan'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
