import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final Function? onTap;
  final bool? showOutline;

  ReusableCard({this.color, this.child, this.onTap, this.showOutline});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Theme.of(context).colorScheme.primaryContainer,
          border: showOutline == true
              ? BoxBorder.all(color: AppConstants.kAccentColor, width: 2)
              : null,
        ),
        child: child,
      ),
    );
  }
}
