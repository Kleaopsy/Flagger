import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';
import 'flags/level_1.dart';

void main() => runApp(const Flags());

List<Color> colorPalatte = getDarkColorPalatte();

class Flags extends StatelessWidget {
  const Flags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Level1()))),
            child: Container(
              width: screenWidth,
              height: 100,
              decoration: BoxDecoration(color: colorPalatte[1]),
              child: Row(
                children: [
                  const SizedBox(width: 50),
                  const Image(image: AssetImage('assets/images/flags/fr.png')),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      SizedBox(height: 25),
                      Text(
                        'Level - 1',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: screenWidth,
            height: 100,
            decoration: BoxDecoration(color: colorPalatte[0]),
            child: Row(
              children: [
                const SizedBox(width: 50),
                const Image(image: AssetImage('assets/images/flags/jp.png')),
                const SizedBox(width: 20),
                Column(
                  children: const [
                    SizedBox(height: 25),
                    Text(
                      'Level - 2',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 100,
            decoration: BoxDecoration(color: colorPalatte[1]),
            child: Row(
              children: [
                const SizedBox(width: 50),
                const Image(image: AssetImage('assets/images/flags/cn.png')),
                const SizedBox(width: 20),
                Column(
                  children: const [
                    SizedBox(height: 25),
                    Text(
                      'Level - 3',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 100,
            decoration: BoxDecoration(color: colorPalatte[0]),
            child: Row(
              children: [
                const SizedBox(width: 50),
                const Image(image: AssetImage('assets/images/flags/tr.png')),
                const SizedBox(width: 20),
                Column(
                  children: const [
                    SizedBox(height: 25),
                    Text(
                      'Level - 4',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
