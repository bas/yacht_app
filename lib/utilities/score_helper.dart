import 'package:flutter/foundation.dart';
import 'constants.dart';

const List<Map<String, String>> categories = [
  {'category': kOnes, 'score': 'The sum of dice with the number 1'},
  {'category': kTwos, 'score': 'The sum of dice with the number 2'},
  {'category': kThrees, 'score': 'The sum of dice with the number 3'},
  {'category': kFours, 'score': 'The sum of dice with the number 4'},
  {'category': kFives, 'score': 'The sum of dice with the number 5'},
  {'category': kSixes, 'score': 'The sum of dice with the number 6'},
  {'category': kFullHouse, 'score': 'Sum of three of one number and two of another'},
  {'category': kFourOfAKind, 'score': 'Sum of at least four dice showing the same face'},
  {'category': kLittleStraight, 'score': '1-2-3-4-5 (30 points)'},
  {'category': kBigStraight, 'score': '2-3-4-5-6 (30 points)'},
  {'category': kChoice, 'score': 'Sum of all dice with any combination'},
  {'category': kYacht, 'score': 'All five dice showing the same face (50 points)'},
];

int _count(List<int> dice, int n) {
  return dice.where((i) => i == n).length;
}

int _highestRepeated(List<int> dice, int minRepeats) {
  var unique = dice.toSet().toList();
  var repeats = [];
  unique.forEach((n) {
    if (_count(dice, n) >= minRepeats) {
      repeats.add(n);
    }
  });
  repeats.sort();
  return repeats.isNotEmpty ? repeats.last : 0;
}

int sumOfSingle(List<int> dice, int n) {
  var map = Map();
  dice.forEach((x) => map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));
  return map.containsKey(n) ? map[n] * n : 0;
}

// The sum of dice with the number 1
int ones(List<int> dice) {
  return sumOfSingle(dice, 1);
}

// The sum of dice with the number 2
int twos(List<int> dice) {
  return sumOfSingle(dice, 2);
}

// The sum of dice with the number 3
int threes(List<int> dice) {
  return sumOfSingle(dice, 3);
}

// The sum of dice with the number 4
int fours(List<int> dice) {
  return sumOfSingle(dice, 4);
}

// The sum of dice with the number 5
int fives(List<int> dice) {
  return sumOfSingle(dice, 5);
}

/// The sum of dice with the number 6
int sixes(List<int> dice) {
  return sumOfSingle(dice, 6);
}

// Three of one number and two of another
int fullHouse(List<int> dice) {
  var map = Map();
  dice.forEach((x) => map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));
  if (map.length == 2 && map.containsValue(2) && map.containsValue(3)) {
    return choice(dice);
  } else {
    return 0;
  }
}

// At least four dice showing the same face
int fourOfAKind(List<int> dice) {
  return _highestRepeated(dice, 4) * 4;
}

// 1-2-3-4-5
int littleStraight(List<int> dice) {
  dice.sort();
  return (listEquals(dice, [1, 2, 3, 4, 5])) ? 30 : 0;
}

// 2-3-4-5-6
int bigStraight(List<int> dice) {
  dice.sort();
  return (listEquals(dice, [2, 3, 4, 5, 6])) ? 30 : 0;
}

// Any combination
int choice(List<int> dice) {
  return dice.reduce((a, b) => a + b);
}

// All five dice showing the same face
int yacht(List<int> dice) {
  return dice.toSet().toList().length == 1 ? 50 : 0;
}

int getScore(List<int> dice, String category) {
      switch (category) {
      case kOnes:
        return ones(dice);
      case kTwos:
        return twos(dice);
      case kThrees:
        return threes(dice);
      case kFours:
        return fours(dice);
      case kFives:
        return fives(dice);
      case kSixes:
        return sixes(dice);
      case kFullHouse:
        return fullHouse(dice);
      case kFourOfAKind:
        return fourOfAKind(dice);
      case kLittleStraight:
        return littleStraight(dice);
      case kBigStraight:
        return bigStraight(dice);
      case kChoice:
        return choice(dice);
      case kYacht:
        return yacht(dice);
      default:
        return 0;
    }
}
