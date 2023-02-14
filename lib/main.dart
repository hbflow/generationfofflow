import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/pages/time.dart';
import 'package:hybriidflow/pages/unknown.dart';
import 'package:hybriidflow/widgets/slots/livetime.dart';
import 'package:page_transition/page_transition.dart';
import 'pages/firstpage.dart';
import 'dart:html';
import 'dart:ui' as ui;

import 'pages/mainsimple.dart';
// ignore: avoid_web_libraries_in_flutter

void main() {
  Paint.enableDithering = true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> timercount() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        activecount++;
      });

    });

    void open () { Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: timepage()));}

    if (activecount >= 9)
      open();

    else
      timercount();


  }



  void initState() {
    super.initState();
    setState(() {


    });

    //timercount();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      //onPointerDown: (_) => print('down'), // best place to reset timer imo
      //onPointerMove: (_) => print('move'),
      //onPointerUp: (_) => print('up'),

      child: MaterialApp(
        title: 'HybriidFlow',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
        ),
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: mainpage.route,

        routes: {
          firstpage.route: (context) => firstpage(),
          mainpage.route: (context) => mainpage(),
          timepage.route: (context) => timepage(),
          simplepage.route: (context) => simplepage(),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => unknownpage()),
      ),
    );
  }
}
