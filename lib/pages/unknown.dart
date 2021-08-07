// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'dart:async';
import 'main.dart';
import 'package:universal_io/io.dart';

class unknownpage extends StatefulWidget {
  static const String route = '/404';
  @override
  _unknownpageState createState() => _unknownpageState();
}

class _unknownpageState extends State<unknownpage> {

  String hybriidtext = "Wrong Link?";

  Future<void> playy() async {
    print('2nd working');

    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        hybriidtext = "Where Are You?";
      });
    });
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        hybriidtext = "Tap Anywhere to go back....";
      });
    });
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        hybriidtext = "Or Just.. Stay Here :)";
      });
    });
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        hybriidtext = "You're still here.....";
      });
    });
    await Future.delayed(const Duration(seconds: 5), () {
      playy();
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
        body: Stack(
          children: [
            fstext(
              text: ('404'),
              text2: (hybriidtext),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [GestureDetector(

                child: Container(
                  child: Text('', style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      fontFamily: 'Schyler'),),
                ),
              )],
            )
          ],
        ),
      ),
    );
  }
}
