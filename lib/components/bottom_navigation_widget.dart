import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yacht_app/services/game_service.dart';

class BottomNavigationWidget extends StatelessWidget {
  final GameService game;

  BottomNavigationWidget({this.game});

  @override
  Widget build(BuildContext context) {
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
  }
}