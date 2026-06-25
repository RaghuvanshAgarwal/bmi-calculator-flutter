import 'package:bmi_calculator/components/value_with_unit.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/gender_type.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/numeric_input_card.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

BmiController calculator = BmiController();

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late final ThemeData themeData = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.kAppBarTitle)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      child: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: AppConstants.kMaleButtonLabel,
                        color: calculator.selectedGender == Gender.Male
                            ? Colors.white
                            : Colors.white54,
                      ),
                      color: calculator.selectedGender == Gender.Male
                          ? themeData.colorScheme.primaryContainer
                          : themeData.colorScheme.secondaryContainer,
                      onTap: () {
                        setState(() {
                          calculator.updateGenderType(Gender.Male);
                        });
                      },
                      showOutline: calculator.selectedGender == Gender.Male,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      child: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: AppConstants.kFemaleButtonLabel,
                        color: calculator.selectedGender == Gender.Female
                            ? Colors.white
                            : Colors.white54,
                      ),
                      color: calculator.selectedGender == Gender.Female
                          ? themeData.colorScheme.primaryContainer
                          : themeData.colorScheme.secondaryContainer,
                      onTap: () {
                        setState(() {
                          calculator.updateGenderType(Gender.Female);
                        });
                      },
                      showOutline: calculator.selectedGender == Gender.Female,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.kHeightSliderLabel,
                      style: themeData.textTheme.bodyMedium,
                    ),
                    ValueWithUnit(
                      context: context,
                      value: calculator.height.round().toString(),
                      unit: 'cm',
                    ),
                    const SizedBox(height: 10),
                    Slider(
                      value: calculator.height,
                      max: AppConstants.kMaxHeight,
                      min: AppConstants.kMinHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          calculator.height = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      child: NumericInputCard(
                        context: context,
                        label: AppConstants.kWeightInputLabel,
                        value: calculator.weight,
                        unit: 'kg',
                        onDecrease: () {
                          setState(() {
                            calculator.weight--;
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            calculator.weight++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      child: NumericInputCard(
                        context: context,
                        label: AppConstants.kAgeInputLabel,
                        value: calculator.age,
                        unit: 'Y',
                        onDecrease: () {
                          setState(() {
                            calculator.age--;
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            calculator.age++;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          onPressed: () {
            calculator.calculate();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ResultsPage(
                    categoryLiteral: calculator.getCategoryLiteral(),
                    categoryLiteralColor: calculator.getCategoryLiteralColor(),
                    bmi: calculator.getBMI(),
                    range: calculator.getRange(),
                    interpretation: calculator.getInterpretation(),
                  );
                },
              ),
            );
          },
          child: Text(AppConstants.kCalculateButtonLabel),
        ),
      ),
    );
  }
}
