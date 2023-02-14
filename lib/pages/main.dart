import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/widgets/bottombar.dart';
import 'package:hybriidflow/widgets/bottombartwo.dart';
import 'package:hybriidflow/widgets/exitbutton.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
import 'package:hybriidflow/widgets/infowidget.dart';
import 'package:hybriidflow/widgets/settingslist.dart';
import 'package:hybriidflow/widgets/slots/analogclock.dart';
import 'package:hybriidflow/widgets/slots/api.dart';
import 'package:hybriidflow/widgets/slots/battery.dart';
import 'package:hybriidflow/widgets/slots/calc.dart';
import 'package:hybriidflow/widgets/slots/cameraview.dart';
import 'package:hybriidflow/widgets/slots/counter.dart';
import 'package:hybriidflow/widgets/slots/def.dart';
import 'package:hybriidflow/widgets/slots/draw.dart';
import 'package:hybriidflow/widgets/slots/fileimageview.dart';
import 'package:hybriidflow/widgets/slots/googletransalate.dart';
import 'package:hybriidflow/widgets/slots/imageview.dart';
import 'package:hybriidflow/widgets/slots/joke.dart';
import 'package:hybriidflow/widgets/slots/livedate.dart';
import 'package:hybriidflow/widgets/slots/livetime.dart';
import 'package:hybriidflow/widgets/slots/platform.dart';
import 'package:hybriidflow/widgets/slots/qrcodecreator.dart';
import 'package:hybriidflow/widgets/slots/quicklinks.dart';
import 'package:hybriidflow/widgets/slots/randomnumber.dart';
import 'package:hybriidflow/widgets/slots/timeanddate.dart';
import 'package:hybriidflow/widgets/startupanimation.dart';
import 'package:hybriidflow/widgets/topbar.dart';
import 'package:hybriidflow/widgets/wallpaper.dart';
import 'package:hybriidflow/widgets/warning.dart';
import 'package:intl/intl.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:universal_io/io.dart';

import 'dart:html' show IFrameElement;
// Import package
import 'package:battery_plus/battery_plus.dart';

import 'dart:math' as math;

import 'dart:ui' as ui;

bool gradientan = false;
int widgetsort = 1;
String sortname = "Category Name";
bool bool_bar = false;

bool isanythingopen = false;
bool shouldshowmusic = false;
bool bigsettings = false;
bool settingson = false;
bool on = false;
bool showwall = false;
String wp = 'assets/hbflowof-min.png';

class WidgetSlotContainer {
  const WidgetSlotContainer(
      this.name, this.widget, this.isgrey, this.categories, this.color);

  final String name;
  final Widget widget;
  final bool isgrey;
  final String categories;
  final Color color;
}

class mainpage extends StatefulWidget {
  static const String route = '/flow';
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  final List<String> slotsnames = <String>[
    'Dictionary',
    'Image Viewer',
    'Platform Widget',
    'Time Widget',
    'Date Widget',
    'Time And Date',
    'QuickLinks',
    'Counter',
    'Google Translate (BETA)',
    'Random Number',
    'QR Code Creator',
    'Mirror (Beta)',
    'Random Joke (BETA)',
  ];

  final List<Widget> slots = <Widget>[
    dict(),
    imageviewer(),
    plat(),
    time(),
    date(),
    timeanddate(),
    quick(),
    counter(),
    ggt(),
    randomnum(),
    qr(),
    camera(),
    jokeapi(),
  ];

  List<Color> colorList = [
    Color(0xff242424),
    Color(0xff1f2021),
    Color(0xff404040),
    Colors.grey,
  ];

  final _controller = ScrollController();
  final _cr = ScrollController();
  final List<int> colorCodes = <int>[600, 500, 100];
  final _height = 100.0;
  DateTime now = DateTime.now();
  String dynamic_s = 's';
  String graphictf = 'Low';
  String anim = 'Off';


  bool _visible = false;
  bool startupvis = true;
  int index = 0;

  bool shouldscroll = false;
  String scrollable = 'Off';
  Color bottomColor = Color(0xff2a2a2a);
  Color topColor = Color(0xff2a2a2a);

  String gradtotext = 'Off';
  String solid = 'On';
  String solid2 = 'Off';
  String warning = 'On';
  bool dockl = false;
  bool showwarning = true;
  bool anywidgets = true;
  bool cc3 = true;

  bool random = true;

  bool tempsetting = false;

  int randomNumber = 0;
  bool smoothergraphics = false;

  void switchsort(){
    print('starting');
    if (widgetsort == 1)
      setState(() {
        widgetsort = 2;
        print(widgetsort);
      });
    else
      setState(() {
        widgetsort = 1;
      });

  }
  void dyn() {
    if (entries.length == 1)
      setState(() {
        dynamic_s = '${entries.length} widget';
        checkifwidgetsexist();
      });
    else
      setState(() {
        dynamic_s = '${entries.length} widgets';
        checkifwidgetsexist();
      });
  }

  addwidgetfromrandom(what) {
    entries.add(slots[what]);
    dyn();
    print('chile');
    on = false;
    isanythingopen = false;
  }

  void white3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }

  void anim3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  void ifcontain() {
    print(entries);
    print(entries.contains(jokeapi()));
    if (entries.any((item) => item is Last == true)) {
      print('CHILE');
      entries.removeLast();
    }
  }

  void pickrandomwidget() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(slots.length);
      print(randomNumber);
    });
    if (randomNumber == 11)
      pickrandomwidget(); //Used to Avoid Camera Widget

    else
      addwidgetfromrandom(randomNumber);
  }

  bool wann = true;
  void wanim() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        wann = false;
      });
    });
  }

  void scroll(ani) {
    _controller.animateTo(ani,
        duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

// This is what you're looking for!
  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }



  void checkifwidgetsexist() {
    if (entries.length == 0)
      setState(() {
        anywidgets = true;
      });
    else
      setState(() {
        anywidgets = false;
      });
  }

  Future<void> ofenonight() async {
    print(await battery.batteryLevel);
  }

  void changegraphics() {
    if (smoothergraphics == true)
      setState(() {
        smoothergraphics = false;
        graphictf = 'Low';
      });
    else
      setState(() {
        smoothergraphics = true;
        graphictf = 'High';
      });
  }

  void bigsetting() {
    if (bigsettings == true)
      setState(() {
        bigsettings = false;
      });
    else
      setState(() {
        bigsettings = true;
      });
  }

  Future<void> startup() async {
    await Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _visible = !_visible;
        print('SCOOP');
      });
    });
    await Future.delayed(Duration(seconds: 1), () {
      startupvis = false;
    });
  }

  void changesolid() {
    if (issolid == true)
      setState(() {
        issolid = false;
        solid = 'On';
        print('border');
      });
    else
      setState(() {
        issolid = true;
        solid = 'Off';
        print('border');
      });
  }

  bool docks = true;
  String dstyle = "New";

  void dockstyle() {
    if (bool_bar == true)
      setState(() {
        bool_bar = false;
        dstyle = 'New';
        print('border');
      });
    else
      setState(() {
        bool_bar = true;
        dstyle = 'Classic';
        print('border');
      });
  }


  void dockshow() {
    if (dockl == true)
      setState(() {
        dockl = false;
        solid2 = 'Off';
        print('border');
      });
    else
      setState(() {
        dockl = true;
        solid2 = 'On';
        print('border');
      });
  }

  void warningshow() {
    if (showwarning == true)
      setState(() {
        showwarning = false;
        warning = 'Off';
        print('border');
      });
    else
      setState(() {
        showwarning = true;
        warning = 'On';
        print('border');
      });
  }

  String israndom = 'On';
  void randomshow() {
    if (random == true)
      setState(() {
        random = false;
        israndom = 'Off';

        print('border');
      });
    else
      setState(() {
        random = true;
        israndom = 'On';

        print('border');
      });
  }

  String isborder = 'On';
  String isbattery = 'On';
  void bordershow() {
    if (border == true)
      setState(() {
        border = false;
        isborder = 'Off';

        print('border');
      });
    else
      setState(() {
        border = true;
        isborder = 'On';

        print('border');
      });
  }

  bool battery0 = false;
  void battery_() {
    if (battery0 == true)
      setState(() {
        battery0 = false;

        print('battery');
      });
    else
      setState(() {
        battery0 = true;

        print('battery');
      });
  }

  void changescroll() {
    if (shouldscroll == true)
      setState(() {
        shouldscroll = false;
        scrollable = 'Off';
        print('TURNEDOFF');
      });
    else
      setState(() {
        shouldscroll = true;
        scrollable = 'On';
      });
  }

  void changeanimtoonoff() {
    if (gradientan == true)
      setState(() {
        gradtotext = 'On';
      });
    else
      setState(() {
        gradtotext = 'Off';
      });
  }

  void changeganim() {
    if (gradientan == true)
      setState(() {
        gradientan = false;
        anim = 'Off';
      });
    else
      setState(() {
        gradientan = true;
        anim = 'On';
      });
  }

  void addmenu() {

    if (on == true)
      setState(() {
        on = false;
        opened = true;

        dyn();
        isanythingopen = false;
        print(smoothergraphics);
      });
    else
      setState(() {
        on = true;
        settingson = false;
        anywidgets = false;
        opened = true;

        isanythingopen = true;
        print(smoothergraphics);
        dyn;
      });
  }

  void settingmenu() {
    if (settingson == true)
      setState(() {
        settingson = false;
        dyn();
        isanythingopen = false;
      });
    else
      setState(() {
        settingson = true;
        on = false;
        dyn;
        anywidgets = false;
        isanythingopen = true;
      });
  }

  void colorchange() {
    setState(() {
      bottomColor = Colors.blue;
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
    if (this.mounted) {
      setState(() {
        entries.removeAt(at);
      });
    }
  }

  void settingtemp(tempo) {
    if (tempo == true)
      setState(() {
        tempsetting = true;
        print('TEMPSETTING');
      });
    else
      setState(() {
        tempsetting = false;
        print('TEMPSETTING');
      });
  }

  var battery = Battery();
  int percentage = 0;

  @override

  // method created to display battery percent
  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
    Future.delayed(Duration(seconds: 5), () {
      getBatteryPerentage();
    });
  }

  void initState() {
    super.initState();
    gettime();
    dyn();
    startup();
    Paint.enableDithering = true;
    wanim();
    getBatteryPerentage();
    // ignore: undefined_prefixed_name
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Stack(
              children: [
                hilly(),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: smoothergraphics == false
                      ? Color(0x434B4B4B)
                      : Color(0x9A9A9A),
                ),
                Center(
                  child: Column(
                    children: [
                      topbar(),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(
                            dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse,
                            },
                          ),
                          child: ListView.builder(
                              controller: _controller,
                              itemCount: entries.length,
                              addAutomaticKeepAlives: true,
                              scrollDirection:
                                  MediaQuery.of(context).size.width < 600
                                      ? Axis.vertical
                                      : Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Transform.scale(
                                  scale: 0.97,
                                  child: Stack(
                                    children: [
                                      Flex(
                                        direction:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? Axis.vertical
                                                : Axis.horizontal,
                                        children: [
                                          InkWell(
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      600
                                                  ? 0
                                                  : 30,
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      600
                                                  ? 30
                                                  : 0,
                                            ),
                                            onTap: delete,
                                          ),
                                          if (shouldscroll == false) ...[
                                            infowidget(
                                              slot: entries[index],
                                              what: () {
                                                remove(index);

                                                dyn();
                                              },
                                              dupl: () {
                                                entries.add(entries[index]);
                                                dyn();
                                              },
                                              sshow: tempsetting,
                                              key: ValueKey(1),
                                            ),
                                          ] else ...[
                                            SingleChildScrollView(
                                              child: GestureDetector(
                                                child: infowidget(
                                                  slot: entries[index],
                                                  what: () {
                                                    remove(index);

                                                    dyn();
                                                  },
                                                  dupl: () {
                                                    entries.add(entries[index]);
                                                    dyn();
                                                  },
                                                ),
                                                onTap: () {},
                                              ),
                                              clipBehavior: Clip.none,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Center(
                        child: warning1(
                          visible1: showwarning,
                          visible2: anywidgets,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        child: bool_bar == true ? bottombar(ftext: dockl == false
                            ? '${DateFormat('h:mm').format(now)} • ${Platform.operatingSystem} ${battery0 == true ? "• ${percentage}%" : ""} '
                            : '${DateFormat('h:mm').format(now)} • ${Platform.operatingSystem} • ${entries.length} ${battery0 == true ? "• ${percentage}%" : ""}',
                          action: () {
                            addmenu();
                          },
                          saction: () {
                            settingmenu();
                            colorchange();
                          },) : bottom2bar(
                          ftext: dockl == false
                              ? '${DateFormat('h:mm').format(now)} • ${Platform.operatingSystem} ${battery0 == true ? "• ${percentage}%" : ""} '
                              : '${DateFormat('h:mm').format(now)} • ${Platform.operatingSystem} • ${entries.length} ${battery0 == true ? "• ${percentage}%" : ""}',
                          action: () {
                            addmenu();
                          },
                          saction: () {
                            settingmenu();
                            colorchange();
                          },
                        ),
                        //onTap: entries.length < 1 ? add : delete,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
                visible: startupvis,
                child: AnimatedOpacity(
                  opacity: _visible ? 0.0 : 1.0,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0xff808080),
                  ),
                )),
            StartAnim(
              vis1: startupvis,
              vis2: _visible,
            ),
            Column(
              //WIDGET
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  //widgetadd
                  visible: on,
                  child: Listener(
                      onPointerSignal: (ps) {
                        if (ps is PointerScrollEvent) {
                          final newOffset = _cr.offset + ps.scrollDelta.dy;
                          if (ps.scrollDelta.dy.isNegative) {
                            _cr.jumpTo(math.max(0, newOffset));
                          } else {
                            _cr.jumpTo(math.min(
                                _cr.position.maxScrollExtent, newOffset));
                          }
                        }
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Widgets",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 25,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                            ),
                            Text(
                              "Scroll down or press the expand button for more",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 10,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                    ),
                                  ],
                                  fontFamily: 'Schyler'),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            AnimatedContainer(
                              width: MediaQuery.of(context).size.width / 1.1,
                              height: bigsettings == false ? 320 : 600,
                              curve: Curves.easeInOutCirc,
                              duration: Duration(
                                  milliseconds: issolid == true ? 0 : 300),
                              decoration: BoxDecoration(
                                color: Color(0xb4878787),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xa3181818),
                                    spreadRadius: 1,
                                    blurRadius: 9,
                                    offset: Offset(0,
                                        1), // changes position of shadow
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: -12.0,
                                    blurRadius: 12.0,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Stack(
                                  children: [
                                    Visibility(
                                        visible: true,
                                        child: Center(
                                          child: AddWidget(
                                            controller: _cr,
                                            visible: random,
                                            ontap: pickrandomwidget,
                                            ontap2: bigsetting,
                                            setting2: switchsort,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),

                Container(
                  width: 50,
                  height: 76,
                ) //thing used to add space to the bottom of the widget adder
              ],
            ),
            Column(
              //SETTING
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  //settingadd
                  visible: settingson,
                  child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Listener(
                            onPointerSignal: (ps) {
                              if (ps is PointerScrollEvent) {
                                final newOffset =
                                    _cr.offset + ps.scrollDelta.dy;
                                if (ps.scrollDelta.dy.isNegative) {
                                  _cr.jumpTo(math.max(0, newOffset));
                                } else {
                                  _cr.jumpTo(math.min(
                                      _cr.position.maxScrollExtent, newOffset));
                                }
                              }
                            },
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Settings",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 25,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(0.0, 3.0),
                                              blurRadius: 3.0,
                                              color: Colors.black54,
                                            ),
                                          ],
                                          fontFamily: 'Schyler'),
                                    ),
                                    Text(
                                      "Scroll down or press the expand button for more",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 10,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(0.0, 3.0),
                                              blurRadius: 3.0,
                                              color: Colors.black54,
                                            ),
                                          ],
                                          fontFamily: 'Schyler'),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Center(
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: AnimatedContainer(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.1,
                                              height: bigsettings == false
                                                  ? 320
                                                  : 600,
                                              curve: Curves.easeInOutCirc,
                                              duration: Duration(
                                                  milliseconds: issolid == true
                                                      ? 0
                                                      : 300),
                                              decoration: BoxDecoration(
                                                color: Color(0xb4878787),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xa3181818),
                                                    spreadRadius: 1,
                                                    blurRadius: 9,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    spreadRadius: -12.0,
                                                    blurRadius: 12.0,
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: Stack(
                                                  children: [
                                                    SettingOptions(
                                                      option1: () {
                                                        changegraphics();
                                                      },
                                                      option2: () {
                                                        changeganim();
                                                        changeanimtoonoff();
                                                      },
                                                      option3: () {
                                                        changesolid();
                                                      },
                                                      option4: () {
                                                        changescroll();
                                                      },
                                                      option5: () {
                                                        dockstyle();
                                                      },
                                                      option6: () {
                                                        warningshow();
                                                      },
                                                      option7: () {
                                                        randomshow();
                                                      },
                                                      option8: () {
                                                        bordershow();
                                                      },
                                                      option50: () {
                                                        dockstyle();
                                                      },
                                                      option0: () {
                                                        battery_();
                                                      },
                                                      o1text: graphictf,
                                                      o2text: gradtotext,
                                                      o3text: solid,
                                                      o4text: scrollable,
                                                      o5text: solid2,
                                                      o6text: warning,
                                                      o7text: israndom,
                                                      o8text: isborder,
                                                      o0text: isbattery,
                                                      o50text: dstyle,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                MouseRegion(
                                                                  onHover:
                                                                      anim3,
                                                                  onExit:
                                                                      white3,
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        bigsetting,
                                                                    child:
                                                                        MouseRegion(
                                                                      onHover:
                                                                          anim3,
                                                                      onExit:
                                                                          white3,
                                                                      child:
                                                                          AnimatedContainer(
                                                                        width: cc3 ==
                                                                                true
                                                                            ? 35
                                                                            : 60,
                                                                        curve: Curves
                                                                            .easeInOutBack,
                                                                        duration: Duration(
                                                                            milliseconds: issolid == true
                                                                                ? 0
                                                                                : 300),
                                                                        height:
                                                                            35,
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .fullscreen,
                                                                          color:
                                                                              Color(0xff033808),
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                            color: cc3 == true ? Color(0xda06a316) : Color(0xff06a316),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: Colors.black.withOpacity(0.5),
                                                                                spreadRadius: 2,
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
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: IgnorePointer(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height: 290,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ));
                      }),
                ),
                Container(
                  width: 50,
                  height: 76,
                ) //thing used to add space to the bottom of the settings adder
              ],
            ),
            Visibility(visible: showwall, child: AddWallpaper()),
            Visibility(
              visible: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('${MediaQuery.of(context).size.height}')],
              ),
            ),
          ],
        ),
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
  final category;
  final add;
  final color;

  const option({Key key, this.text, this.add, this.color, this.category}) : super(key: key);
  @override
  _optionState createState() => _optionState();
}

class _optionState extends State<option> {
  bool cc = true;

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

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 10,),

          SizedBox(
            child: MouseRegion(
              onHover: anim,
              onExit: white,
              child: InkWell(
                onTap: widget.add,
                child: Center(
                  //MediaQuery.of(context).size.width > 800
                  //cc == true ? 100 : 120,
                  //
                  child: AnimatedContainer(
                    height: MediaQuery.of(context).size.width > 1000
                        ? cc == true
                            ? 100
                            : 115
                        : cc == true
                            ? 90
                            : 110,
                    width: MediaQuery.of(context).size.width > 1000
                        ? cc == true
                            ? 185
                            : 185
                        : cc == true
                            ? 175
                            : 175,
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: issolid == true ? 0 : 350),
                    child: Center(
                      child: AnimatedContainer(
                        curve: Curves.easeInOutBack,
                        duration:
                            Duration(milliseconds: issolid == true ? 0 : 350),
                        child: Center(
                            child: Center(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Stack(
                                  children: [
                                    Visibility(
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.text,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xffe5e5e5),
                                                fontSize: 26,
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    offset: Offset(0.0, 3.0),
                                                    blurRadius: 3.0,
                                                    color: Colors.black54,
                                                  ),
                                                ],
                                                fontFamily: 'Schyler'),
                                          ),
                                          Text(
                                            widget.category,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xffa2a2a2),
                                                fontSize: 18,
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    offset: Offset(0.0, 3.0),
                                                    blurRadius: 3.0,
                                                    color: Colors.black54,
                                                  ),
                                                ],
                                                fontFamily: 'Schyler'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                        )),
                        decoration: BoxDecoration(
                          //colors
                          color: Color(0xda191919),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              cc == false ? widget.color : Color(0xFF3A393A),
                              cc == true ? widget.color : Color(0xFF3A393A),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
        ],
      ),
    );
  }
}

class blurwidget extends StatefulWidget {
  final what;

  const blurwidget({Key key, this.what}) : super(key: key);
  @override
  _blurwidgetState createState() => _blurwidgetState();
}

class _blurwidgetState extends State<blurwidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: GestureDetector(
          onTap: widget.what,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}

class blackedoutwidget extends StatefulWidget {
  final what;

  const blackedoutwidget({Key key, this.what}) : super(key: key);
  @override
  _blackedoutwidgetState createState() => _blackedoutwidgetState();
}

class _blackedoutwidgetState extends State<blackedoutwidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: GestureDetector(
        onTap: widget.what,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black, Color(0xff212121)],
            ),
          ),
        ),
      ),
    );
  }
}

class hilly extends StatefulWidget {
  @override
  _hillyState createState() => _hillyState();
}

class _hillyState extends State<hilly> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: OverflowBox(
        child: FittedBox(
          child: Image(image: AssetImage(wp)),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        maxWidth: double.infinity,
        maxHeight: double.infinity,
      ),
    );
  }
}

final List<Widget> entries = <Widget>[];

class AddWidget extends StatefulWidget {
  final controller;
  final o_list;

  final visible;
  final setting2;
  final ontap;
  final ontap2;

  const AddWidget(
      {Key key,
      this.controller,
      this.o_list,
      this.visible,
      this.ontap,
      this.ontap2, this.setting2})
      : super(key: key);
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final ScrollController _firstController = ScrollController();
  bool cc3 = true;

  void white3(PointerEvent details) {
    setState(() {
      cc3 = true;
    });
  }

  void anim3(PointerEvent details) {
    setState(() {
      cc3 = false;
    });
  }

  void addimage() {
    entries.add(imageviewer());
  }

  List<WidgetSlotContainer> widgetstoadd = [
    WidgetSlotContainer(
        'Dictionary', dict(), false, widgetsort == 1 ? 'Tool' : '',   widgetsort == 2 ?  Color(0xFF496543) : Color(
        0x697E7E7E)),
    WidgetSlotContainer('Counter', counter(key: ValueKey(1)), false, widgetsort == 1 ? 'Tool' : '',
        widgetsort == 2 ?  Color(0xFF496543) : Color(
            0x697E7E7E)),
    WidgetSlotContainer(
        'QuickLinks', quick(), false, widgetsort == 1 ? 'Tool' : '',  widgetsort == 2 ?  Color(0xFF496543) : Color(
        0x697E7E7E)),
    WidgetSlotContainer(
        'Random Number', randomnum(), false, widgetsort == 1 ? 'Tool' : '',   widgetsort == 2 ?  Color(0xFF496543) : Color(
        0x697E7E7E)),
    WidgetSlotContainer(
        'Image Viewer', imageviewer(), true, widgetsort == 1 ? 'Tool' : '',   widgetsort == 2 ?  Color(0xFF496543) : Color(
        0x697E7E7E)),
    WidgetSlotContainer(
        'QR Code Creator', qr(), false,  widgetsort == 1 ? 'Tool' : '',  widgetsort == 2 ?  Color(0xFF496543) : Color(
  0x697E7E7E)),

    // WidgetSlotContainer('FImage Viewer', fimageviewer(), true),


    WidgetSlotContainer(
        'Time and Date', timeanddate(), false,  widgetsort == 1 ? 'Info' : '',widgetsort == 2 ?  Color(0xFF436465) : Color(
        0x697E7E7E)),
    WidgetSlotContainer(
        'Time Widget', time(), false,  widgetsort == 1 ? 'Info' : '', widgetsort == 2 ?  Color(0xFF436465) : Color(
        0x697E7E7E)),

    WidgetSlotContainer(
        'Date Widget', date(), false,  widgetsort == 1 ? 'Info' : '', widgetsort == 2 ?  Color(0xFF436465) : Color(
        0x697E7E7E)),
    WidgetSlotContainer(
        'Platform Widget', plat(), false,  widgetsort == 1 ? 'Info' : '', widgetsort == 2 ?  Color(0xFF436465) : Color(
        0x697E7E7E)),

    WidgetSlotContainer(
        'Analog Clock', Analog(), false, widgetsort == 1 ? 'Info' : '',widgetsort == 2 ?  Color(0xFF436465) : Color(
        0x697E7E7E)),



    WidgetSlotContainer(
        'Random Joke', jokeapi(), false, widgetsort == 1 ? 'Fun' : '', widgetsort == 2 ?  Color(
        0xFF654362) : Color(
        0x697E7E7E) ),

    WidgetSlotContainer(
        'Mirror (Beta)', camera(), false, widgetsort == 1 ? 'Tool' : '', Color(0xFF9C6D6D)),

    WidgetSlotContainer(
        'Google Translate (BETA)', ggt(), false, widgetsort == 1 ? 'Tool' : '', Color(0xFF9C6D6D)),
    WidgetSlotContainer(
        'Battery (BETA)', bat(), false, widgetsort == 1 ? 'Info' : '', Color(0xFF9C6D6D)),
    WidgetSlotContainer(
        'LastFM Scrobbler (BETA)', Last(), false, widgetsort == 1 ? 'Tool' : '', Color(0xFF9C6D6D)),
  ];

  final List<String> categories = <String>[
    'Tools',
    'Info Widgets',
  ];
  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  String eee = 'widgetstoadd';
  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _firstController.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          _firstController.animateTo(offset - 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        } else {
          _firstController.animateTo(offset - 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _firstController.animateTo(offset + 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        } else {
          _firstController.animateTo(offset + 30,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
          print('Scroll working');
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scrollbar(
          thumbVisibility: true,
          controller: _firstController,
          child: RawKeyboardListener(
            focusNode: _focusNode,
            autofocus: true,
            onKey: _handleKeyEvent,
            child: SingleChildScrollView(
              controller: _firstController,
              child: Column(
                children: [
                  SizedBox(height: 10,),

                  SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    runSpacing: 15.0,
                    alignment: WrapAlignment.center,
                    children: [
                      for (int i = 0; i < widgetstoadd.length; i++)
                        Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                                child: option(
                              text: widgetstoadd[i].name,
                              category: widgetstoadd[i].categories,
                              color: widgetstoadd[i].color,

                              add: () {
                                entries.add(widgetstoadd[i].widget);

                                print('PRINT ${entries}');
                                setState(() {
                                  on = false;
                                  isanythingopen = false;
                                  print('${isanythingopen} IS W');
                                });
                              },
                            )),
                          ],
                        ),

                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: widget.visible,
                        child: InkWell(
                          onTap: widget.ontap,
                          child: Container(
                            width: 200,
                            height: 49,
                            child: Center(
                              child: Text(
                                'Random Widget',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 3.0),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                    fontFamily: 'Schyler'),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xda191919),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Color(0xFFBA751D),
                                  Color(0xFFE3BF17),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Visibility(
                    visible: false,
                    child: Wrap(
                      runSpacing: 50.0,
                      children: [
                        for (int i = 0; i < categories.length; i++)
                          Column(
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  child: option(
                                text: categories[i],
                                add: () {
                                  entries.add(widgetstoadd[i].widget);

                                  print('PRINT ${entries}');
                                  setState(() {
                                    on = false;
                                    isanythingopen = false;
                                    print('${isanythingopen} IS W');
                                  });
                                },
                              )),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Visibility(
                              visible: widget.visible,
                              child: InkWell(
                                onTap: widget.ontap,
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(0.0, 3.0),
                                              blurRadius: 3.0,
                                              color: Colors.black54,
                                            ),
                                          ],
                                          fontFamily: 'Schyler'),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff658e5c),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color(0xffcb9509),
                                      width: 3,
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        Color(0xffffe25c),
                                        Color(0xDCBD892D)
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: ClipRRect(
              borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
              ),
              child: Visibility(
                visible:
                    MediaQuery.of(context).size.width < 1952 ? true : false,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: issolid == true ? 0 : 300),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 40,
                  curve: Curves.easeInOutCirc,

                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      colors: [
                        Colors.transparent,
                        Color(0x70000000),
                      ], // red to yellow
                      // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    MouseRegion(
                      onHover: anim3,
                      onExit: white3,
                      child: InkWell(
                        onTap: widget.ontap2,
                        child: MouseRegion(
                          onHover: anim3,
                          onExit: white3,
                          child: AnimatedContainer(
                            width: cc3 == true ? 35 : 60,
                            curve: Curves.easeInOutBack,
                            duration: Duration(
                                milliseconds: issolid == true ? 0 : 300),
                            height: 35,
                            child: Icon(
                              Icons.fullscreen,
                              color: Color(0xff033808),
                            ),
                            decoration: BoxDecoration(
                                color: cc3 == true
                                    ? Color(0xda06a316)
                                    : Color(0xff06a316),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
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
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(),
          ],
        )
      ],
    );
  }
}
