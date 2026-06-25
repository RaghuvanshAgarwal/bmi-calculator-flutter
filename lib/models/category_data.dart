import 'dart:math';
import 'package:bmi_calculator/models/gender_type.dart';
import 'package:flutter/material.dart';

class CategoryData {
  final String _literal;
  final Color _color;
  final Map<Gender, List<String>> _interpretations;
  final double _startRange;
  final double _endRange;

  CategoryData({
    required this._literal,
    required this._color,
    required this._interpretations,
    required this._startRange,
    required this._endRange,
  });

  String get literal => _literal;
  Color get color => _color;
  String getInterpretation(Gender gender_type) {
    return _interpretations[gender_type]![Random().nextInt(
      _interpretations[gender_type]!.length,
    )];
  }

  double get startRange => _startRange;
  double get endRange => _endRange;
}
