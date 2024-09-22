import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceRoller());
}

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final List<String> imagesList = [
    'images/dice-1.png',
    'images/dice-2.png',
    'images/dice-3.png',
    'images/dice-4.png',
    'images/dice-5.png',
    'images/dice-6.png'
  ];

  int randomNumber = Random().nextInt(6); // initial random number

  void rollDice() {
    setState(() {
      randomNumber = Random().nextInt(6); // new random number
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color.fromARGB(255, 6, 13, 75),
                Color.fromARGB(255, 6, 63, 161)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(imagesList[randomNumber]),
                  height: 100,
                  width: 100,
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: rollDice, // call rollDice when pressed
                  child: Text("ROLL DICE"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
