import 'dart:math';

import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/cupertino.dart';

class CalculateBMI {
  CalculateBMI({
    @required this.height,
    @required this.weight,
    @required this.gender,
    @required this.age,
  });

  double height;
  double weight;

  GenderType gender;
  int age;

  double _bmi;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getResultMessage() {
    if (_bmi >= 25)
      return 'You have heighter than normal body weight. Excersice more...';
    else if (_bmi > 18.5)
      return 'You have normal body weight. Keep it up';
    else
      return 'You have lower than normal body weight. Eat more...';
  }

  String getGender() {
    if (gender == GenderType.female) return 'Female';
    if (gender == GenderType.male) return 'Male';
    return null;
  }
}
