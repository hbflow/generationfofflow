import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'dart:async';
import 'main.dart';

class firstpage extends StatefulWidget {
  static const String route = '/welcome';
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  String hybriidtext = "Let's get you Started :)";

  Future<void> playy() async {
    print('2nd working');

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        hybriidtext = "Tap Anywhere";
      });
    });
  }

  void initState() {
    super.initState();
    playy();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the overview page using a named route.
        Navigator.of(context).pushNamed(mainpage.route);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: fstext(
          text: ('Welcome to HybriidFlow'),
          text2: (hybriidtext),
        ),
      ),
    );
  }
}
