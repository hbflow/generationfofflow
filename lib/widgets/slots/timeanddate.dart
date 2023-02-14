import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../fullscreencentertext.dart';

class timeanddate extends StatefulWidget {
  const timeanddate({key}) : super(key: key);

  @override
  _timeanddateState createState() => _timeanddateState();
}

class _timeanddateState extends State<timeanddate> {
  DateTime now = DateTime.now();



  void gettime() {
    setState(() {
      now = DateTime.now();
    });


    Future.delayed(Duration(seconds: 1), () {
      gettime();
    });
  }

  void initState() {
    super.initState();
    gettime();
    // ignore: undefined_prefixed_name

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: fstext(
        text: ('${DateFormat('h').format(now)}:${DateFormat('ms').format(now)}'),
        text2: ('${DateFormat('yMMMMd').format(now)}') ,
        color: Color(0xffc7c7c7),
        color2: Color(0xffc7c7c7),
      ),
    );
  }
}
