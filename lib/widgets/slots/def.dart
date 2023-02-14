import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:hybriidflow/pages/main.dart';

class dict extends StatefulWidget {
  @override
  _dictState createState() => _dictState();
}

class _dictState extends State<dict> {
  String g = '';
  List c;
  List m;
  String definiton = 'lllllll';

  void getdata() async {

    Response response = await get(Uri.parse(
        'https://api.dictionaryapi.dev/api/v2/entries/en_US/$definiton'));
    List data = jsonDecode(response.body);
    List<dynamic> meanings = data[0]['meanings'];

    String definitions = '';
    for (var i = 0; i < meanings.length; i++) {
      List<dynamic> defs = meanings[i]['definitions'];
      for (var j = 0; j < defs.length; j++) {
        String definition = defs[j]['definition'];
        definitions += (j + 1).toString() + '. ' + definition + '\n';
      }
    }

    setState(() {
      g = definitions;
    });
  }
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),


    );

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getdata();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: getdata,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xda191919),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white60, Color(0xDCFFFFFF)],
                ),
              ),
              height: 300,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Center(
                    child: Text(
                      g,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 15,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 3.0,
                              color: Colors.black54,
                            ),
                          ],
                          fontFamily: 'Schyler'),
                    ),
                  )
                ),
              ),

            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
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
            child: TextFormField(
              textAlign: TextAlign.center,
              maxLength: 60,
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
                  hintText:
                      'Tap here to search up definition, Max Letters = 60',
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
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: getdata,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              children: [




              ],
            )),
          ),








        ],
      ),
    );
  }
}
