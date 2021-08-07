
import 'package:flutter/material.dart';



class bottombar extends StatefulWidget {

  final ftext;

  const bottombar({key, this.ftext}) : super(key: key);
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
              children: [ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.add, color: Colors.black),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Colors.grey, // <-- Button color
                  onPrimary: Colors.black,
                  shadowColor: Colors.black// <-- Splash color
                ),
              ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.settings, color: Colors.black),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      primary: Colors.grey, // <-- Button color
                      onPrimary: Colors.black,
                      shadowColor: Colors.black// <-- Splash color
                  ),
                )],
            ),
          ),
          Center(child: Text(widget.ftext, style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontFamily: 'Schyler',
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0.0, 3.0),
                blurRadius: 3.0,
                color: Colors.black54,
              ),

            ],),
          )),
        ],
      ),
    );
  }
}

