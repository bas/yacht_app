import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yacht_app/services/game_service.dart';
import 'package:yacht_app/screens/dice_page.dart';
import 'package:yacht_app/screens/score_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider<GameService>(
      create: (context) => GameService(),
      child: YachtApp(),
    ),
  );
}

class YachtApp extends StatelessWidget {
  final currentTab = [
    RollDicePage(),
    ScoreCardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<GameService>(
        builder: (context, game, child) {
          return currentTab[game.currentIndex];
        },
      ),
    );
  }
}








