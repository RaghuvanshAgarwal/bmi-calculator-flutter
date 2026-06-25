import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String _categoryLiteral;
  final Color _categoryLiteralColor;
  final double _bmi;
  final String _range;
  final String _interpretation;

  ResultsPage({
    required this._categoryLiteral,
    required this._categoryLiteralColor,
    required this._bmi,
    required this._range,
    required this._interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.kResultPageHeader,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppConstants.kSecondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _categoryLiteral.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: _categoryLiteralColor,
                      ),
                    ),
                    Text(
                      _bmi.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      '${_categoryLiteral} BMI Range:',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.white54),
                    ),
                    Text(
                      '${_range} kg/m2',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 40),
                    Text(
                      _interpretation,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                      textWidthBasis: TextWidthBasis.parent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(AppConstants.kRecalculateButtonLabel),
        ),
      ),
    );
  }
}
