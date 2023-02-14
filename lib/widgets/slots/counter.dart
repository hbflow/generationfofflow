import 'package:flutter/material.dart';
import 'package:hybriidflow/global/globvabs.dart';
import 'package:hybriidflow/pages/main.dart';
import 'package:hybriidflow/widgets/fullscreencentertext.dart';
int count = 0;


class counter extends StatefulWidget {

  final int pop;

  const counter({Key key, this.pop}) : super(key: key);


  @override

  _counterState createState() => _counterState();
}

class _counterState extends State<counter>  {




  @override

  void initState() {
    super.initState();
    count = count;

  }
  void add() {
    setState(() {
     count++;
    });
    print(count);
  }
  void subtract() {
    setState(() {
      count--;
    });
    print(count);
  }
  void reset() {
    setState(() {
      count = 0;
    });
    print(count);
  }



  bool cc = true;
  bool cc2 = true;
  bool cc3 = true;
  bool cc4 = true;

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
  @override


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(

        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: add,
              child: MouseRegion(
                onHover: anim,
                onExit: white,
                child: AnimatedContainer(
                  curve: Curves.easeInOutCirc,
                  duration: Duration(milliseconds: issolid == true ? 0 : 260),
                  width: cc == true ? 100 : 120,
                  height: cc == true ? 100 : 110,
                  child: Icon(Icons.add, color: Colors.black) ,

                  decoration: BoxDecoration(
                    color: Color(0xFFB6B6B6),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Color(0xFFB6B6B6),
                        Color(0xFF808080)
                      ],
                    ),

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MouseRegion(
              onHover: anim2,
              onExit: white2,
              child: Container(

                width: 300,
                height: 300,
                child: fstext(text: count, text2: 'Counter',),
                decoration: BoxDecoration(
                  color: Color(0xFFB6B6B6),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      Color(0xFF808080),
                      Color(0xFFB6B6B6),


                    ],
                  ),


                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: subtract,
              child: MouseRegion(
                onHover: anim3,
                onExit: white3,
                child: AnimatedContainer(
                  curve: Curves.easeInOutCirc,
                  duration: Duration(milliseconds: issolid == true ? 0 : 260),
                  width: cc3 == true ? 100 : 120,
                  height: cc3 == true ? 100 : 110,
                child: Icon(Icons.remove, color: Colors.black) ,

                decoration: BoxDecoration(
                  color: Color(0xFFB6B6B6),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),

                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xFFB6B6B6),
                      Color(0xFF808080)
                    ],
                  ),

                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: reset,
              child:  MouseRegion(
                  onHover: anim4,
                  onExit: white4,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: issolid == true ? 0 : 260),
                    width: cc4 == true ? 300 : 320,
                    height: cc4 == true ? 30 : 40,
                child: Center(child: Text('Reset', style: TextStyle(fontFamily: 'Schyler'),) ),
                decoration: BoxDecoration(
                  color: Color(0xFFB6B6B6),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),

                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
