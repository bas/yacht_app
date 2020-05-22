import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yacht_app/services/game_service.dart';
import 'package:yacht_app/components/dice_widget.dart';
import 'package:yacht_app/components/bottom_navigation_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RollDicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameService>(
      builder: (context, game, child) {
        return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text('Yacht Dice Game'),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  DiceWidget(
                    dice: game.dices[0],
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[0]);
                    },
                  ),
                  DiceWidget(
                    dice: game.dices[1],
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
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[2]);
                    },
                  ),
                  DiceWidget(
                    dice: game.dices[3],
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
                    diceHandler: () {
                      game.toggleDiceSelected(game.dices[4]);
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Turn: ${game.turn}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationWidget(
            game: game,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              game.rollDices();
            },
            label: Text('Roll Dice'),
            icon: Icon(FontAwesomeIcons.dice),
            backgroundColor: Colors.pink,
          ),
        );
      },
    );
  }
}