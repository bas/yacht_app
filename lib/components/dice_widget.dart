import 'package:flutter/material.dart';
import 'package:yacht_app/services/dice_model.dart';

class DiceWidget extends StatelessWidget {
  DiceWidget({@required this.dice, @required this.diceHandler});

  final DiceModel dice;
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
            color: dice.selected ? Colors.deepOrange : Colors.lightBlue,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}