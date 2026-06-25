import 'package:flutter/material.dart';

abstract class AppConstants {
  static const Color kPrimaryColor = Color(0xFF0A0E21);
  static const Color kSecondaryColor = Color(0xFF1D1E33);
  static const Color kSecondaryContainerColor = Color(0xFF1111328);
  static const Color kAccentColor = Color(0xFFEA1456);
  static const String kSecondaryFontFamily = 'Nunito';
  static const String kPrimaryFontFamily = 'SNPro';
  static const String kAppBarTitle = 'BMI CALCULATOR';
  static const String kCalculateButtonLabel = 'CALCULATE';
  static const String kRecalculateButtonLabel = 'RE-CALCULATE';
  static const String kResultPageHeader = 'YOUR RESULT';
  static const String kMaleButtonLabel = 'MALE';
  static const String kFemaleButtonLabel = 'FEMALE';
  static const String kHeightSliderLabel = 'HEIGHT';
  static const String kWeightInputLabel = 'WEIGHT';
  static const String kAgeInputLabel = 'AGE';
  static const double kMinHeight = 120;
  static const double kMaxHeight = 220;
}
