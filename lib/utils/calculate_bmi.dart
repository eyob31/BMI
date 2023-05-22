import 'dart:math';

class BmiLogic {
  final int height;
  final int weight;

  BmiLogic({required this.height, required this.weight});

  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than Normal body weight. Try to exercise more.\n Sport and Eat';
    } else if (_bmi! > 18.5) {
      return 'You have a Normal body weight. Good Job!\n Perfect';
    } else {
      return 'You have a lower than Normal body weight. You can eat a bit more. \n Eat Drink Chew';
    }
  }
}
