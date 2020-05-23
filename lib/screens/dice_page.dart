import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yacht_app/services/game_service.dart';
import 'package:yacht_app/components/dice_widget.dart';
import 'package:yacht_app/components/bottom_navigation_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yacht_app/utilities/constants.dart';

class DicePage extends StatelessWidget {
  final List<String> _turnLabels = [
    'Roll the dice!',
    'First roll',
    'Second roll',
    'Last roll',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<GameService>(
      builder: (context, game, child) {
        return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text(
              kAppTitle,
              style: kAppBarTitleTextStyle,
            ),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  DiceWidget(
                    dice: game.dices[0],
                    turn: game.turn,
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[0]);
                    },
                  ),
                  DiceWidget(
                    dice: game.dices[1],
                    turn: game.turn,
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[1]);
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  DiceWidget(
                    dice: game.dices[2],
                    turn: game.turn,
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[2]);
                    },
                  ),
                  DiceWidget(
                    dice: game.dices[3],
                    turn: game.turn,
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[3]);
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  DiceWidget(
                    dice: game.dices[4],
                    turn: game.turn,
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[4]);
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Round: ${game.round + 1}',
                          style: kTurnLabelTextStyle,
                        ),
                        Text(
                          _turnLabels[game.turn],
                          style: kTurnLabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationWidget(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              game.rollDices();
            },
            label: Text(
              'Roll Dice',
              style: kButtonTextStyle,
            ),
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(FontAwesomeIcons.dice),
            ),
            backgroundColor: game.turn < 3 ? Colors.pink : Colors.pink[200],
          ),
        );
      },
    );
  }
}
