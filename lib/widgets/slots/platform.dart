import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

import '../fullscreencentertext.dart';

class plat extends StatefulWidget {
  const plat({key}) : super(key: key);

  @override
  _platState createState() => _platState();
}

class _platState extends State<plat> {
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
        text: ('${Platform.operatingSystem}'),
        text2: ('${Platform.operatingSystemVersion}') ,
      ),
    );
  }
}
