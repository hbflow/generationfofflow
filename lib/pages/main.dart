import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:hybriidflow/widgets/slots/def.dart';
import 'package:hybriidflow/widgets/slots/imageview.dart';
import 'package:hybriidflow/widgets/slots/livedate.dart';
import 'package:hybriidflow/widgets/slots/livetime.dart';
import 'package:hybriidflow/widgets/slots/platform.dart';
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
  final List<Widget> entries = <Widget>[
    dict(),
    plat(),
    imageviewer(),
    time(),


    dict(),
    plat(),
    imageviewer(),
    time(),







  ];
  final _controller = ScrollController();
  final List<int> colorCodes = <int>[600, 500, 100];
  final _height = 100.0;
  DateTime now = DateTime.now();
  String dynamic_s = 's';
  void dyn() {
    if (entries.length == 1)
      setState(() {
        dynamic_s = '${entries.length} widget';
      });
    else
      setState(() {
        dynamic_s = '${entries.length} widgets';
      });
  }

  void scroll(ani){
    _controller.animateTo(ani, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);

  }


  void gettime() {
    setState(() {
      now = DateTime.now();
    });

    Future.delayed(Duration(seconds: 1), () {
      gettime();
    });
  }

  void love(crazy) {
    print(crazy);
  }

  void add() {
    setState(() {
      entries.add(imageviewer());
    });
    dyn();
    print(dynamic_s);
  }

  void delete() {
    setState(() {
      entries.removeLast();
    });
    dyn();
    print(dynamic_s);
  }

  void remove(at){
    setState(() {
      entries.removeAt(at);
    });
  }

  void initState() {
    super.initState();
    gettime();
    dyn();
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
                        controller: _controller,
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
                                  height:
                                      MediaQuery.of(context).size.width < 600
                                          ? 30
                                          : 0,
                                ),
                                onTap: delete,
                              ),
                              GestureDetector(
                                child: infowidget(
                                  slot: entries[index],
                                  what: (){remove(index);},
                                ),
                                onTap: add,
                              ),
                            ],
                          );
                        }),
                  ),
                  GestureDetector(
                    child: bottombar(
                      ftext:
                          '${DateFormat('h:mm').format(now)} | ${Platform.operatingSystem} | ${dynamic_s} ',
                    ),
                    onTap:  entries.length < 1 ? add : delete ,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
  _animateToIndex(i) => _controller.animateTo(_height * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
}
//Container(
//                           height: 100,
//                           width: 100,
//                           color: Colors.white,
//                           child: Text(entries.length > 1 ?'There are ${entries.length } Squares' : 'There is 1 Square'),
//                         ),
