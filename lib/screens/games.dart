import 'package:flutter/material.dart';

void main() => runApp(Games());

class Games extends StatefulWidget {
  Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Text('Games');
  }
}
