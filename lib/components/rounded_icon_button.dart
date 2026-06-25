import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedIconButton extends StatelessWidget {
  final FaIcon? icon;
  final VoidCallback? onPressed;

  RoundedIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      elevation: 6.0,
      onPressed: onPressed ?? null,
      fillColor: AppConstants.kAccentColor,
      splashColor: AppConstants.kPrimaryColor.withAlpha(50),
      shape: CircleBorder(),
      constraints: BoxConstraints.tight(Size(56, 56)),
    );
  }
}
