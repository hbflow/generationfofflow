import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/widgets/blurredcontainerwidget.dart';

import '../settings.dart';

class Analog extends StatefulWidget {
  @override
  _AnalogState createState() => _AnalogState();
}

class _AnalogState extends State<Analog> {
  bool cc = true;
  bool visibilesetting = false;
  String sn = 'On';

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

  void vssetting(){
    if (visibilesetting == true)
      setState(() {
        visibilesetting = false;
      });
    else
      setState(() {
        visibilesetting = true;
      });
  }

  void second(){
    if (showseconds == true)
      setState(() {
        showseconds = false;
        sn = 'Off';
      });
    else
      setState(() {
        showseconds = true;
        sn = 'On';
      });
  }
  String tn = 'On';
  void tick(){
    if (showticks == true)
      setState(() {
        showticks = false;
        tn = 'Off';
      });
    else
      setState(() {
        showticks = true;
        tn = 'On';
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            child:FlutterAnalogClock(
              dateTime: DateTime.now(),
              dialPlateColor: Color(0xA83B3B3B),
              hourHandColor: Color(0xE1E5E5E5),
              minuteHandColor: Color(0xE1E5E5E5),
              secondHandColor: Color(0xE1EA9B9B),
              numberColor: Color(0xE1E5E5E5),
              borderColor: Color(0xE1E5E5E5),
              tickColor: Color(0xE1E5E5E5),
              centerPointColor: Color(0xFFE5E5E5),
              showBorder: true,
              showTicks: showticks,
              showMinuteHand: true,
              showSecondHand: showseconds,
              showNumber: true,
              borderWidth: 3.0,

              hourNumberScale: .90,
              hourNumbers: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
              isLive: true,
              width: 380.0,
              height: 380.0,
              decoration: const BoxDecoration(),

            ),
          ),
        ),
        Visibility(
            visible: visibilesetting,child: Center(child: BContainer(child: Center(
              child: Wrap(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      option(stext: sn, s: second, textsize: 20, ogtextl: 'Show Second Hand',),
                      SizedBox(
                        height: 30,
                      ),
                      option(stext: tn, s: tick, textsize: 20, ogtextl: 'Show Ticks',),
                    ],
                  ),

                ],
              ),
            ) ,))),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            MouseRegion(
              onHover: anim,
              onExit: falseanim,
              child: InkWell(
                onTap: vssetting,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: issolid == true ? 0 : 300),
                  width: cc == true ? 35 : 48,
                  height: 35,
                  curve: Curves.easeInOutBack,
                  child:
                  Icon(Icons.settings, color: Color(0xff505050)),
                  decoration: BoxDecoration(
                      color:
                      cc == true ? Color(0xd3afafaf) : Color(0xffc4c4c4),
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
                      borderRadius: BorderRadius.circular(30)),
                ),

              ),
            ),

          ],
        ),
      ],
    );
  }
}
