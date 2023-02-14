import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/pages/time.dart';
import 'package:hybriidflow/pages/unknown.dart';
import 'package:hybriidflow/widgets/warning.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

String currenterror = "";

class topbar extends StatefulWidget {
  final ftext;
  final action;
  final saction;
  final widgetexist;

  const topbar({key, this.ftext, this.action, this.saction, this.widgetexist})
      : super(key: key);
  @override
  _topbarState createState() => _topbarState();
}

class _topbarState extends State<topbar> {
  Color top = Colors.grey.withOpacity(1);
  Color top2 = Colors.grey.withOpacity(0.5);
  bool cc = true;
  String mm = 'FE';

  bool cc2 = true;
  bool ver1 = false;
  bool ver2 = false;
  bool rounded = true;

  void changever(PointerEvent details){
    setState(() {
      ver1 = true;
      rounded = false;
    });
  }
  void unver(PointerEvent details){
    setState(() {
      ver1 = false;
      rounded = true;
    });
  }
  void changever2(PointerEvent details){
    setState(() {
      ver2 = true;
    });
  }
  void unver2(PointerEvent details){
    setState(() {
      ver2 = false;
    });
  }

  void white(PointerEvent details) {
    setState(() {
      cc = true;
    });
  }

  void anim(PointerEvent details) {
    setState(() {
      cc = false;
    });
  }

  void falseanim(PointerEvent details) {
    setState(() {
      cc = true;
    });
  }

  void white2(PointerEvent details) {
    setState(() {
      cc2 = false;
    });
  }

  void blue2(PointerEvent details) {
    setState(() {
      cc2 = true;
    });
  }

  void blue(PointerEvent details) {
    setState(() {
      top = Color(0xffdeffc4);
    });
  }

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['hybriidbox@gmail.com'],
      subject: 'Hybriidflow Feedback ',
      body: '',
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: anim,
      onExit: white,
      child: AnimatedContainer(
        width: double.infinity,
        height: cc == true ? 32 : 39,
        duration: Duration(milliseconds: issolid == true ? 0 : 250),
        curve: Curves.easeInOutCirc,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [


                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: timepage()));
                  },
                  child: Tooltip(
                    message: 'Start Screen Saver',
                    height: 2.5,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),
                        ],
                        fontFamily: 'Schyler'),
                    child: MouseRegion(
                      onEnter: changever,
                      onExit: unver,
                      child: AnimatedContainer(
                          width: 35,
                          height: cc == true ? 39 : 44,

                          duration:
                              Duration(milliseconds: issolid == true ? 0 : 100),
                          decoration: BoxDecoration(
                              color: ver1 == true ? Color(0x3C505050) : Color(
                                  0x0),


                          ),
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.black38,
                            size: 20,
                          )),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    opened = false;
                  },
                  child: Tooltip(
                    message: 'Remove All Widgets',
                    height: 2.5,

                    textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),
                        ],
                        fontFamily: 'Schyler'),
                    child:
                      MouseRegion(
                        onEnter: changever2,
                        onExit: unver2,
                      child: AnimatedContainer(
                          width: 35,
                          height: cc == true ? 39 : 44,

                          duration:
                              Duration(milliseconds: issolid == true ? 0 : 100),
                          decoration: BoxDecoration(
                              color: ver2 == true ? Color(0x3C505050) : Color(
                                  0x0),

                              ),
                          child: Icon(
                            Icons.highlight_remove_rounded,
                            color: Colors.black38,
                            size: 20,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Text('${currenterror}', style: TextStyle(
                fontWeight: FontWeight.w900,

                color: Colors.redAccent,
                fontSize: 14,


                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 3.0),
                    blurRadius: 3.0,
                    color: Colors.black54,
                  ),
                ],
                fontFamily: 'Schyler'),),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 7,
                  child: FittedBox(
                    child: Image(image: AssetImage('assets/minum.png')),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0x6FADADAD),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(rounded == true ? 12 : 0), bottomRight: Radius.circular(12)),

          boxShadow: [
            BoxShadow(
              color: Color(0x51000000),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
