import 'package:flutter/material.dart';

class imageviewer extends StatefulWidget {
  @override
  _imageviewerState createState() => _imageviewerState();
}

class _imageviewerState extends State<imageviewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xffa3a3a3),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network('https://images-na.ssl-images-amazon.com/images/I/71Cb7oS1cuL.jpg'),
          )
        ),
      ),
    );
  }
}
