import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:bmi_calculator/components/value_with_unit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumericInputCard extends StatelessWidget {
  final String label;
  final int value;
  final String unit;
  final Function onDecrease;
  final Function onIncrease;
  final BuildContext context;

  NumericInputCard({
    required this.context,
    required this.label,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
    required this.unit,
  }) {}

  late final ThemeData themeData = Theme.of(context);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: themeData.textTheme.bodyMedium),
        ValueWithUnit(
          context: context,
          value: value.round().toString(),
          unit: unit,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundedIconButton(
              icon: FaIcon(FontAwesomeIcons.minus, size: 30),
              onPressed: () {
                onDecrease();
              },
            ),
            SizedBox(width: 10),
            RoundedIconButton(
              icon: FaIcon(FontAwesomeIcons.plus, size: 30),
              onPressed: () {
                onIncrease();
              },
            ),
          ],
        ),
      ],
    );
  }
}
