import 'package:flutter/material.dart';

class bottombar extends StatefulWidget {
  final ftext;
  final action;

  const bottombar({key, this.ftext, this.action}) : super(key: key);
  @override
  _bottombarState createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, -4), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(

                  child: Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.add, color: Colors.black) ,

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
                        colors: <Color>[
                          Colors.white,
                          Colors.white60
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                        BoxShadow(
                          color:Colors.black.withOpacity(0.5),
                          spreadRadius: -12.0,
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                  ),
                  onTap: widget.action,
                ),
                InkWell(


                  child: Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.settings, color: Colors.black) ,

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
                        colors: <Color>[
                          Colors.white,
                          Colors.white60
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                        BoxShadow(
                          color:Colors.black.withOpacity(0.5),
                          spreadRadius: -12.0,
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
          Center(
              child: Text(
            widget.ftext,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontFamily: 'Schyler',
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 3.0),
                  blurRadius: 3.0,
                  color: Colors.black54,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
