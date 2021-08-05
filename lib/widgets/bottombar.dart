
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
      color: Colors.white,
      height: 60,
      width: double.infinity,
      child: Center(child: Text(widget.ftext, style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
          fontFamily: 'Schyler'), )),
    );
  }
}

