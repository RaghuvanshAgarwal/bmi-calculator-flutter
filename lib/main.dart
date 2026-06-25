import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: AppConstants.kPrimaryColor,
        colorScheme: ColorScheme.light().copyWith(
          primaryContainer: AppConstants.kSecondaryColor,
          secondaryContainer: AppConstants.kSecondaryContainerColor,
        ),
        appBarTheme: AppBarThemeData(
          backgroundColor: AppConstants.kPrimaryColor,
          foregroundColor: Colors.white,
          elevation: 20,
          shadowColor: Colors.black87,
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 7, 9, 25),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20,
            fontFamily: AppConstants.kSecondaryFontFamily,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 40,
            fontFamily: AppConstants.kSecondaryFontFamily,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
            fontFamily: AppConstants.kPrimaryFontFamily,
          ),

          titleMedium: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
            fontFamily: AppConstants.kSecondaryFontFamily,
          ),

          headlineLarge: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 100,
            fontFamily: AppConstants.kPrimaryFontFamily,
          ),
        ),
        bottomAppBarTheme: BottomAppBarThemeData(
          color: AppConstants.kAccentColor,
          height: 50,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(0),
            splashFactory: NoSplash.splashFactory,
            overlayColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: AppConstants.kSecondaryFontFamily,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 2,
          thumbColor: AppConstants.kAccentColor,
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.white54,
          activeTickMarkColor: Colors.red,
          overlayColor: AppConstants.kAccentColor.withAlpha(40),
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
        ),
      ),
      home: InputPage(),
    );
  }
}
