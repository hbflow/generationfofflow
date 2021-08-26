import 'package:flutter/material.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:hybriidflow/widgets/slots/api.dart';
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
    imageviewer(),
  ];
  final List<Widget> slots = <Widget>[
    dict(),
    imageviewer(),
    error(),
    plat(),
    time(),
    date(),
  ];
  final List<String> slotsnames = <String>[
    'Dictionary',
    'Image Viewer',
    'Web View(BETA)',
    'Platform',
    'Time',
    'Date',
  ];
  final _controller = ScrollController();
  final List<int> colorCodes = <int>[600, 500, 100];
  final _height = 100.0;
  DateTime now = DateTime.now();
  String dynamic_s = 's';
  bool on = false;
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

  void scroll(ani) {
    _controller.animateTo(ani,
        duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

  void addmenu() {
    if (on == true)
      setState(() {
        on = false;
      });
    else
      setState(() {
        on = true;
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

  void remove(at) {
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
                                  what: () {
                                    remove(index);
                                  },
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
                      action: () {
                        addmenu();
                      },
                    ),
                    //onTap: entries.length < 1 ? add : delete,
                  )
                ],
              ),
              Visibility(
                visible: on,
                child: Stack(
                  children: [
                    ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            addmenu();
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    ClipRect(
                      child: Center(
                        child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 2,
                            color: Colors.black,
                            child: RepaintBoundary(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  shrinkWrap: true,

                                  scrollDirection:
                                      MediaQuery.of(context).size.width < 600
                                          ? Axis.vertical
                                          : Axis.horizontal,
                                  itemCount: slots.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return option(
                                      text: slotsnames[index],
                                      add: () {
                                        entries.add(slots[index]);
                                        print('DONEEE');
                                        setState(() {
                                          on = false;
                                        });
                                      },
                                    );
                                  }),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _animateToIndex(i) => _controller.animateTo(_height * i,
      duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
}
//Container(
//                           height: 100,
//                           width: 100,
//                           color: Colors.white,
//                           child: Text(entries.length > 1 ?'There are ${entries.length } Squares' : 'There is 1 Square'),
//                         ),

class option extends StatefulWidget {
  final text;
  final add;

  const option({Key key, this.text, this.add}) : super(key: key);
  @override
  _optionState createState() => _optionState();
}

class _optionState extends State<option> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Row(

        children: [
          SizedBox(width: 50,),
          SizedBox(
            child: InkWell(
              onTap: widget.add,
              child: Container(
                width: 300,
                height: 300,
                child: Center(
                  child: Container(
                    width: 300,
                    child: Center(child: Center(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(widget.text,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 3.0,
                                color: Colors.black54,
                              ),

                            ],

                            fontFamily: 'Schyler'),),
                      ),
                    )),
                    height: 300,
                    decoration: BoxDecoration(
                      color: Color(0xff808080),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Colors.white, Colors.white60],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: -12.0,
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
