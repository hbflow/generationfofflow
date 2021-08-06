import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:async';

class dict extends StatefulWidget {
  @override
  _dictState createState() => _dictState();
}

class _dictState extends State<dict> {
  String g = 'Retrieving definition';
  String definiton = 'lllllll';

  void getdata() async {
    Response response = await get(Uri.parse(
        'https://api.dictionaryapi.dev/api/v2/entries/en_US/$definiton'));
    List data = jsonDecode(response.body);
    print(data);

    String datetime = data.first['meanings'][0]['definitions'][0]['definition'];
    print(datetime);
    setState(() {
      g = datetime;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: getdata,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              height: 80,
              child: Center(
                  child: SelectableText(
                g,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 10,
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
            ),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            maxLength: 50,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 10,
              fontFamily: 'Schyler',
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 3.0),
                  blurRadius: 3.0,
                  color: Colors.black54,
                ),

              ],),
            scrollPhysics: NeverScrollableScrollPhysics(),
            cursorColor: Colors.black,
            onFieldSubmitted: (text) {
              setState(() {
                definiton = text;
                getdata();
              });
            },
            decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,


                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: 'Tap here to search up definition, Max Leters = 50',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 10,
                  fontFamily: 'Schyler',
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 3.0),
                      blurRadius: 3.0,
                      color: Colors.black54,
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: getdata,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 80,
              child: Center(
                  child: Text(
                'Definitions from ©Google Definitions',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 10,
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
            ),
          ),
        ],
      ),
    );
  }
}
