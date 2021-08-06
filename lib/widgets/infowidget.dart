import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';
// import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;
import 'dart:html';

import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'package:hybriidflow/widgets/slots/livedate.dart';
import 'package:hybriidflow/widgets/slots/livetime.dart';
// ignore: camel_case_types
// ignore: undefined_prefixed_name
String src = 'https://flutter.dev/docs/development/tools/web-renderers';


class infowidget extends StatefulWidget {

  final slot;
  final what;

  const infowidget({Key key, this.slot, this.what}) : super(key: key);



  @override
  _infowidgetState createState() => _infowidgetState();
}

class _infowidgetState extends State<infowidget> {



  int test = 3;
  String ss = src;


  void initState() {
    super.initState();
    print(src);



    //Note: IMPLEMENT WEB IN ITS ON FILE NOW!

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'hello-world-html',
            (int viewId) => IFrameElement()
          ..width = '200'
          ..height = '260'
          ..src = src
          ..style.border = 'none');
  }









  @override
  Widget build(BuildContext context, ) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.what,
          child: Container(
            width: 30,
            height: 100,

            decoration: BoxDecoration(
                color: Color(0xff8c4343),
              borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
        Container(
          width: 400,
           height: 800,
           child: widget.slot ,



           decoration: BoxDecoration(
            color: Color(0xff5c5c5c),
            borderRadius: BorderRadius.circular(30),
               border: Border.all(
                 color: Colors.black,
                 width: 4,
               ),
             boxShadow: [
               BoxShadow(
                 color: Colors.black.withOpacity(0.5),
                 spreadRadius: 5,
                 blurRadius: 7,
                 offset: Offset(0, 3), // changes position of shadow
               ),
             ],
        ),
        ),
      ],
    );
  }
}

class testtext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('1st option');
  }
}

class testtext2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('2nd option');
  }
}

class testtext3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('3rd option');
  }
}

class seconds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('3rd option');
  }
}

class error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        fstext(text: 'Loading ${src} ', text2: 'Please wait',),
        HtmlElementView(viewType: 'hello-world-html'),
      ],
    );
  }
}