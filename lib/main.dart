import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        appBarTheme: AppBarThemeData(
          backgroundColor: Color(0xFF0A0E21),
          foregroundColor: Colors.white,
          elevation: 20,
          shadowColor: Colors.black87,
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Color(0xFF0C1234),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Nunito'),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            fontFamily: 'SNPro',
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
//0A0E21

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Center(child: Text('Body Text')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
