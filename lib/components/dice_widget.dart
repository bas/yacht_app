import 'package:flutter/material.dart';
import 'package:yacht_app/services/dice_model.dart';

class DiceWidget extends StatelessWidget {
  DiceWidget({@required this.dice, @required this.diceHandler, this.turn});

  final DiceModel dice;
  final int turn;
  final Function diceHandler;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: diceHandler,
        child: Container(
          child: Image.asset('images/dice${dice.dots}.png'),
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          decoration: BoxDecoration(
            //color: dice.selected ? Colors.deepOrange : Colors.lightBlue,
            color: getDiceColor(),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  getDiceColor() {
    if (turn == 0) return Colors.deepOrange[50];
    if (dice.selected) {
      return Colors.deepOrange;
    } else {
      return Colors.lightBlue;
    }
  }
}