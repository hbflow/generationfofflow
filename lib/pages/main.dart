import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';
import 'dart:html' show IFrameElement;

import 'dart:ui' as ui;

class mainpage extends StatefulWidget {
  static const String route = '/flow';
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  final List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C',];
  final List<int> colorCodes = <int>[600, 500, 100];
  DateTime now = DateTime.now();
  String dynamic_s ='s';

  void change_s(){
    if (entries.length >= 1)
      setState(() {
        dynamic_s = 's';

      }); else if (entries.length == 0) setState(() {
      dynamic_s = 's';

    });
      else if (entries.length == 1)
        setState(() {
          dynamic_s = 'ff';
          print('isnothing');
        });

  }

  void gettime() {
    setState(() {
      now = DateTime.now();
    });


    Future.delayed(Duration(seconds: 1), () {
      gettime();
    });
  }

  void add() {
    setState(() {
      entries.add("Hello World");
    });
    change_s();
    print(dynamic_s);
  }

  void delete() {
    setState(() {
      entries.removeLast();
    });
    change_s();
    print(dynamic_s);
  }

  void initState() {
    super.initState();
    gettime();
    // ignore: undefined_prefixed_name

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
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: entries.length,
                        scrollDirection: MediaQuery.of(context).size.width < 600
                            ? Axis.vertical
                            : Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Flex(
                            direction: MediaQuery.of(context).size.width < 600
                                ? Axis.vertical
                                : Axis.horizontal,
                            children: [
                              InkWell(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width < 600
                                      ? 0
                                      : 30,
                                  height: MediaQuery.of(context).size.width < 600
                                      ? 30
                                      : 0,
                                ),
                                onTap: delete,
                              ),
                              GestureDetector(
                                child: infowidget(),
                                onTap: add,
                              ),
                            ],
                          );
                        }),
                  ),
                  GestureDetector(
                    child: bottombar(
                      ftext:
                          '${DateFormat('h:mm').format(now)} | ${Platform.operatingSystem} | ${entries.length} ',
                    ),
                    onTap: entries.length < 1 ? add : delete ,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
//Container(
//                           height: 100,
//                           width: 100,
//                           color: Colors.white,
//                           child: Text(entries.length > 1 ?'There are ${entries.length } Squares' : 'There is 1 Square'),
//                         ),
