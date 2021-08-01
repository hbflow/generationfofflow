import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

class mainpage extends StatefulWidget {
  static const String route = '/flow';
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  DateTime now = DateTime.now();

  void gettime () {

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
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2a2a2a),
      body: Stack(
        children: [

          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [GestureDetector(
                  onTap: gettime,
                  child: bottombar(ftext: '${DateFormat('h:mm').format(now)} | ${Platform.operatingSystem} ',),
                )],
              )
            ],


          )

        ],
      ),
    );
  }
}
