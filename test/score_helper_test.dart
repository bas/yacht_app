import 'package:flutter_test/flutter_test.dart';
import 'package:yacht_app/utilities/score_helper.dart';

void main() {

  group('Category Helper', () {

    test('categories method success', () {
      expect(categories.length, 12);
    });

    test('ones method success', () {
      expect(ones([2,1,1,5,1]), 3);
    });

    test('twos method success', () {
      expect(twos([2,1,2,5,1]), 4);
    });

    test('threes method success', () {
      expect(threes([2,3,3,5,3]), 9);
    });

    test('fours method success', () {
      expect(fours([2,4,4,4,1]), 12);
    });

    test('fives method success', () {
      expect(fives([2,5,5,5,1]), 15);
    });

    test('sixes method success', () {
      expect(sixes([2,6,6,6,1]), 18);
    });

    test('fourOfAKind method success', () {
      expect(fourOfAKind([2,5,5,5,5]), 20);
    });

    test('fourOfAKind method success', () {
      expect(fourOfAKind([2,5,5,5,5]), 20);
    });
    test('fourOfAKind method success', () {
      expect(fourOfAKind([2,5,5,5,5]), 20);
    });

    test('yacht as fourOfAKind method success', () {
      expect(fourOfAKind([5,5,5,5,5]), 20);
    });

    test('fourOfAKind method fail', () {
      expect(fourOfAKind([2,6,5,5,5]), 0);
    });

    test('fourOfAKind method success', () {
      expect(fourOfAKind([2,2,2,2,5]), 8);
    });

    test('fullHouse method success', () {
      expect(fullHouse([2,2,5,5,5]), 19);
    });

    test('fullHouse method fail', () {
      expect(fullHouse([2,5,5,5,5]), 0);
    });

    test('littleStraight method success', () {
      expect(littleStraight([1,2,3,4,5]), 30);
    });

    test('littleStraight method fail', () {
      expect(littleStraight([1,2,3,5,5]), 0);
    });

    test('bigStraight method success', () {
      expect(bigStraight([2,3,4,5,6]), 30);
    });

   test('bigStraight method fail', () {
      expect(bigStraight([1,3,6,5,6]), 0);
    });

    test('choice method success', () {
      expect(choice([2,2,5,6,6]), 21);
    });

    test('yacht method success', () {
      expect(yacht([5,5,5,5,5]), 50);
    });

    test('yacht method fail', () {
      expect(yacht([5,5,3,5,2]), 0);
    });

  });
}