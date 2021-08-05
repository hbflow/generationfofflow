import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../fullscreencentertext.dart';

class time extends StatefulWidget {
  const time({key}) : super(key: key);

  @override
  _timeState createState() => _timeState();
}

class _timeState extends State<time> {
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
        text: ('${DateFormat('h:mm').format(now)}'),
        text2: ('${DateFormat('s').format(now)}') ,
      ),
    );
  }
}
