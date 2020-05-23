import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yacht_app/services/game_service.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<GameService>(
      builder: (context, game, child) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dice),
              title: Text('Dices'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.list),
              title: Text('Score Card'),
            ),
          ],
          currentIndex: game.currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            game.currentIndex = index;
          },
        );
      },
    );
  }
}
