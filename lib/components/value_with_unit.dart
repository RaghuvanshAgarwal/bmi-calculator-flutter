import 'package:flutter/material.dart';

class ValueWithUnit extends StatelessWidget {
  final BuildContext context;
  final String value;
  final String unit;
  ValueWithUnit({
    required this.context,
    required this.value,
    required this.unit,
  });
  late final ThemeData themeData = Theme.of(context);
  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(value, style: themeData.textTheme.bodyLarge),
        const SizedBox(width: 2),
        Text(unit, style: themeData.textTheme.bodyMedium),
      ],
    );
  }
}
