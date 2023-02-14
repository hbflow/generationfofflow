import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Container(width: 20, height: 40, color: Colors.black,);
  }
}
