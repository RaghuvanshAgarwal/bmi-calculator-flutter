import 'dart:math';

import 'package:bmi_calculator/models/bmi_category.dart';
import 'package:bmi_calculator/models/category_data.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/gender_type.dart';
import 'package:flutter/material.dart';

class BmiController {
  Gender _selectedGender = Gender.Male;
  double _height = 0;
  int _weight = 50;
  int _age = 21;

  BMICategory _category = BMICategory.NormalWeight;

  Map<BMICategory, CategoryData> _categoryDataMap = {
    BMICategory.Underweight: CategoryData(
      literal: 'Underweight',
      color: Colors.lightBlue,
      interpretations: {
        Gender.Male: [
          'Focus on building lean muscle with strength training and a protein-rich diet.',
          'Aim for steady weight gain through nutritious, calorie-dense meals.',
        ],
        Gender.Female: [
          'Build strength with resistance training while increasing calories through wholesome foods.',
          'Prioritize protein and calcium-rich foods to support muscle and bone health.',
        ],
      },
      startRange: -1,
      endRange: 18.5,
    ),

    BMICategory.NormalWeight: CategoryData(
      literal: 'Healthy Weight',
      color: Colors.green,
      interpretations: {
        Gender.Male: [
          'Great job! Keep training regularly and eat a balanced diet to maintain your healthy weight.',
          'Stay active and continue building strength for long-term fitness.',
        ],
        Gender.Female: [
          'Excellent! Maintain your healthy lifestyle with regular exercise and balanced nutrition.',
          'Strength training and an active routine will help keep you healthy and strong.',
        ],
      },
      startRange: 18.5,
      endRange: 24.9,
    ),

    BMICategory.Overweight: CategoryData(
      literal: 'Overweight',
      color: Colors.orange,
      interpretations: {
        Gender.Male: [
          'Focus on reducing body fat while preserving muscle through strength training and a moderate calorie deficit.',
          'Consistency with exercise and healthy eating will deliver lasting results.',
        ],
        Gender.Female: [
          'Aim for gradual, sustainable fat loss through balanced meals and regular physical activity.',
          'Avoid crash diets and focus on habits you can maintain for life.',
        ],
      },
      startRange: 25.0,
      endRange: 29.9,
    ),

    BMICategory.ObesityClassI: CategoryData(
      literal: 'Obesity Class I',
      color: Colors.deepOrange,
      interpretations: {
        Gender.Male: [
          'Small lifestyle changes can make a big difference to your long-term health.',
          'Combine regular exercise with healthy eating to steadily improve your fitness.',
        ],
        Gender.Female: [
          'Take small, sustainable steps toward a healthier lifestyle instead of seeking quick fixes.',
          'Regular activity and balanced nutrition are the foundation of lasting weight loss.',
        ],
      },
      startRange: 30.0,
      endRange: 34.9,
    ),

    BMICategory.ObesityClassII: CategoryData(
      literal: 'Obesity Class II',
      color: Colors.red,
      interpretations: {
        Gender.Male: [
          'A structured fitness and nutrition plan can help you safely reduce health risks.',
          'Consider professional guidance to create a sustainable weight-loss plan.',
        ],
        Gender.Female: [
          'Work toward gradual progress with healthy habits that fit your lifestyle.',
          'Seeking professional support can make your weight-loss journey safer and more effective.',
        ],
      },
      startRange: 35.0,
      endRange: 39.9,
    ),

    BMICategory.ObesityClassIII: CategoryData(
      literal: 'Obesity Class III',
      color: Colors.red.shade900,
      interpretations: {
        Gender.Male: [
          'Your health can improve significantly with the right support and a personalized plan.',
          'Consult a healthcare professional to begin a safe and sustainable weight-loss journey.',
        ],
        Gender.Female: [
          'Every positive step counts—focus on improving your health one habit at a time.',
          'A healthcare professional can help you create a safe, personalized path forward.',
        ],
      },
      startRange: 40.0,
      endRange: -1,
    ),
  };

  Gender get selectedGender => _selectedGender;

  double get height => _height;
  set height(double value) => _height = value;

  int get weight => _weight;
  set weight(int value) => _weight = max(value, 0);

  int get age => _age;
  set age(int value) => _age = max(value, 0);

  BmiController() {
    height = AppConstants.kMinHeight;
  }

  void updateGenderType(Gender selectedGender) {
    _selectedGender = selectedGender;
  }

  void calculate() {
    double bmi = getBMI();
    if (bmi >= 40)
      _category = BMICategory.ObesityClassIII;
    else if (bmi >= 35)
      _category = BMICategory.ObesityClassII;
    else if (bmi >= 30.0)
      _category = BMICategory.ObesityClassI;
    else if (bmi >= 25)
      _category = BMICategory.Overweight;
    else if (bmi >= 18.5)
      _category = BMICategory.NormalWeight;
    else
      _category = BMICategory.Underweight;
  }

  String getCategoryLiteral() {
    return _categoryDataMap[_category]?.literal ?? 'Error';
  }

  Color getCategoryLiteralColor() {
    return _categoryDataMap[_category]?.color ?? Colors.white;
  }

  double getBMI() {
    return weight / pow(height / 100, 2);
  }

  String getRange() {
    final CategoryData data = _categoryDataMap[_category]!;
    if (data.startRange == -1) {
      return '<${data.endRange}';
    } else {
      return '${data.startRange} - ${data.endRange}';
    }
  }

  String getInterpretation() {
    return _categoryDataMap[_category]!.getInterpretation(selectedGender);
  }
}
