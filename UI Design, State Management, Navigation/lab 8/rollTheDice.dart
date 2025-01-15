import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollTheDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Roller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final List<String> diceImages = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Dice-1-b.svg/1200px-Dice-1-b.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Dice-2-b.svg/1200px-Dice-2-b.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Dice-3-b.svg/1200px-Dice-3-b.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Dice-4-b.svg/1200px-Dice-4-b.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Dice-5-b.svg/1200px-Dice-5-b.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Dice-6-b.svg/1200px-Dice-6-b.svg.png',
  ];

  int diceFace = 0;

  void rollDice() {
    setState(() {
      diceFace = Random().nextInt(6); // Random number between 0 and 5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Roll the Dice'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              diceImages[diceFace],
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}