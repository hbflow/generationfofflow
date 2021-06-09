import 'package:flutter/material.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => firstpage(),
      },
    );
  }
}
