import 'package:flutter/material.dart';
import 'package:hybriidflow/pages/main.dart';
import 'pages/firstpage.dart';



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
      initialRoute: firstpage.route,
      routes: {
        firstpage.route: (context) => firstpage(),
        mainpage.route: (context) => mainpage(),
      },
    );
  }
}
