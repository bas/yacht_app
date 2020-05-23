import 'package:flutter/foundation.dart';
import 'package:yacht_app/services/dice_model.dart';
import 'package:yacht_app/utilities/score_helper.dart';
import 'dart:math';

class GameService with ChangeNotifier {
  int _turn = 0;
  int _currentIndex = 0;

  String _categorySelected;

  Map<String, int> _rounds = Map<String, int>();

  List<DiceModel> _dices = List.generate(5, (index) => DiceModel());

  List<DiceModel> get dices => _dices;

  get turn => _turn;

  int get round => _rounds.length;

  void rollDices() {
    if (_turn < 3) {
      _dices.forEach((dice) {
        if (!dice.selected) {
          dice.dots = Random().nextInt(6) + 1;
        }
      });
      _turn++;
    }
    notifyListeners();
  }

  void toggleDiceSelected(DiceModel dice) {
    if (_turn > 0) {
      dice.selected ? dice.selected = false : dice.selected = true;
    }
    if (_dices.every((dice) => dice.selected)) {
      _currentIndex = 1;
    }
    notifyListeners();
  }

  void addScore(String category) {
    if (_turn == 0) return;
    _rounds.remove(_categorySelected);
    int score = getScore(dices.map((e) => e.dots).toList(), category);
    _rounds.putIfAbsent(category, () => score);
    _categorySelected = category;
    notifyListeners();
  }

  String getScoreAsString(String category) {
    int _score = _rounds[category];
    return _score != null ? '$_score' : '';
  }

  bool hasScore(String category) {
    return _rounds[category] == null ? false : true;
  }

  int totalScore() {
    int totalScore = 0;
    _rounds.values.forEach((dots) {
      if (dots != null) totalScore += dots;
    });
    return totalScore;
  }

  void nextRound() {
    if (!_rounds.containsKey(_categorySelected)) return;
    _turn = 0;
    _categorySelected = null;
    _dices = List.generate(5, (index) => DiceModel());
    _currentIndex = 0;
    if (_rounds.length == 12) {
       _rounds.clear();
    }
    notifyListeners();
  }

  bool isSelected(String category) {
    return _categorySelected == category ? true : false;
  }

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

}