import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yacht_app/services/dice_model.dart';

class DiceIconWidget extends StatelessWidget {
  final List diceIcons = [
    FontAwesomeIcons.diceOne,
    FontAwesomeIcons.diceTwo,
    FontAwesomeIcons.diceThree,
    FontAwesomeIcons.diceFour,
    FontAwesomeIcons.diceFive,
    FontAwesomeIcons.diceSix,
  ];

  final DiceModel dice;

  DiceIconWidget({this.dice});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dice.selected ? Colors.white : Colors.white,
      margin: EdgeInsets.all(4.0),
      height: 32.0,
      width: 32.0,
      child: Icon(
        diceIcons[dice.dots - 1],
        color: dice.selected ? Colors.deepOrange : Colors.blue,
        size: 32.0,
      ),
    );
  }
}