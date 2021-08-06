import 'package:flutter/material.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/pages/unknown.dart';
import 'pages/firstpage.dart';
import 'dart:html';
import 'dart:ui' as ui;
// ignore: avoid_web_libraries_in_flutter




void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'HybriidFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: mainpage.route,
      routes: {
        firstpage.route: (context) => firstpage(),
        mainpage.route: (context) => mainpage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => unknownpage()
      ) ,
    );
  }
}
