import 'package:flutter_test/flutter_test.dart';
import 'package:scrum/utils/fire_auth.dart';
import 'package:scrum/controllers/score-calculator.dart';

void main() {
  test(
      'CalculateScore.calculateAddValue() returns a score of remainingTime * 20 + 100.',
      () {
    int remainingTime = 10;
    expect(ScoreCalculator.calculateAddValue(remainingTime), equals(300));
  });
}
