import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: fstext(
        text: 'Welcome to HybriidFlow',
      ),
    );
  }
}
