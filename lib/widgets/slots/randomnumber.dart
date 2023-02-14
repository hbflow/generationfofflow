import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/widgets/slots/counter.dart';
import 'dart:math';

import '../fullscreencentertext.dart';
import 'package:delayed_widget/delayed_widget.dart';

class randomnum extends StatefulWidget {
  const randomnum({Key key}) : super(key: key);
  @override
  _randomnumState createState() => _randomnumState();
}

class _randomnumState extends State<randomnum> {



  int minimum = 1;
  int maximum = 100;
  int randomNumber = 0;


  addmin(){
    setState(() {
      minimum++;
    });
  }
  submin(){
    setState(() {
      minimum--;
    });
  }
  addmax(){
    setState(() {
      maximum++;
    });
  }
  submax(){
    setState(() {
      maximum--;
    });
  }

  makerandom(){
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(maximum) + minimum;
    });
  }

  bool cc = true;
  bool cc2 = true;
  bool cc3 = true;
  bool cc4 = true;
  bool cc5 = true;

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
  void white2(PointerEvent details) {
    setState(() {
      cc2 = true;
    });
  }

  void anim2(PointerEvent details) {
    setState(() {
      cc2 = false;
    });
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
  void white4(PointerEvent details) {
    setState(() {
      cc4 = true;
    });
  }

  void anim4(PointerEvent details) {
    setState(() {
      cc4 = false;
    });
  }
  void white5(PointerEvent details) {
    setState(() {
      cc5 = true;
    });
  }

  void anim5(PointerEvent details) {
    setState(() {
      cc5 = false;
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: MouseRegion(
            onHover: anim,
            onExit: white,
            child: AnimatedContainer(
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: issolid == true ? 0 : 260),
              width: cc == true ? 300 : 320,
              height: cc == true ? 300 : 310,
              child: DelayedWidget(
                delayDuration: Duration(milliseconds: 200),
                animationDuration: Duration(seconds: 1),

                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                child: Center(

                  child: Text(

                    '${randomNumber}',
                    style: TextStyle(

                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize:110,


                      fontFamily: 'Schyler',
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 3.0),
                          blurRadius: 3.0,
                          color: Colors.black26,
                        ),

                      ],),
                  ),
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
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        SizedBox(
          height: 20,
        ),
        Text('Maximum Number', style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xffc7c7c7),
            shadows: <Shadow>[

              Shadow(
                offset: Offset(0.0, 3.0),
                blurRadius: 3.0,
                color: Colors.black54,
              ),

            ],
            fontSize: 20,
            fontFamily: 'Schyler'),),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(

                child: MouseRegion(
                  onHover: anim2,
                  onExit: white2,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: issolid == true ? 0 : 260),
                    width: cc2 == true ? 70 : 80,

                    child: Icon(Icons.remove, color: Colors.black) ,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xda191919),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                      ),
                    ),
                  ),
                ),
                onTap: submax,
              ),
              SizedBox(width: 5,),
              MouseRegion(
                  onHover: anim3,
                  onExit: white3,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: issolid == true ? 0 : 260),
                    width: cc3 == true ? 70 : 80,
                height: 50,
                child: Center(child: Text(maximum.toString(),  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    shadows: <Shadow>[

                      Shadow(
                        offset: Offset(0.0, 3.0),
                        blurRadius: 3.0,
                        color: Colors.black54,
                      ),

                    ],

                    fontFamily: 'Schyler'),)),
                decoration: BoxDecoration(
                  color: Color(0xda191919),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                  ),
                ),
              )),
              SizedBox(width: 5,),
              InkWell(

                child: MouseRegion(
                    onHover: anim4,
                    onExit: white4,
                    child: AnimatedContainer(
                      curve: Curves.easeInOutCirc,
                      duration: Duration(milliseconds: issolid == true ? 0 : 260),
                      width: cc4 == true ? 70 : 80,

                  child: Icon(Icons.add, color: Colors.black) ,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xda191919),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                    ),
                  ),
                )),
                onTap: addmax,
              ),

            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),

        InkWell(
          onTap: makerandom,
          child: Center(
            child: MouseRegion(
                onHover: anim5,
                onExit: white5,
                child: AnimatedContainer(
                  curve: Curves.easeInOutCirc,
                  duration: Duration(milliseconds: issolid == true ? 0 : 260),
                  width: cc5 == true ? 300 : 320,

              height: cc5 == true ? 50 : 60,
              child: Center(child: Text('Pick Number!',  style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  shadows: <Shadow>[

                    Shadow(
                      offset: Offset(0.0, 3.0),
                      blurRadius: 3.0,
                      color: Colors.black54,
                    ),

                  ],

                  fontFamily: 'Schyler'),)),
              decoration: BoxDecoration(
                color: Color(0xda191919),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                ),
              ),
            )),
          ),
        )



      ],
    );
  }
}
