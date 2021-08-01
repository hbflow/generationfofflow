import 'package:flutter/material.dart';

class infowidget extends StatefulWidget {
  @override
  _infowidgetState createState() => _infowidgetState();
}

class _infowidgetState extends State<infowidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
       height: 400,
       decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(30)
    ),
    );
  }
}
