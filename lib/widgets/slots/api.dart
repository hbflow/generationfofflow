import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:async';

import 'secret/privateinfo.dart';
bool isplaying = true;
class Last extends StatefulWidget {
  @override
  _LastState createState() => _LastState();
}

class _LastState extends State<Last> {
  String g = 'Retrieving Music';
  String image = 'https://hbflow.github.io/hbflowimages/wfm1.png';
  String user = 'foxxx000';
  String Audio;
  String Artist;
  String Song ;
  bool verf = false;


  void getdata() async {
    Response response = await get(Uri.parse(
        'https://ws.audioscrobbler.com/2.0/?method=user.getRecentTracks&user=$user&limit=1&api_key=$thekey&format=json'));
    Map data = jsonDecode(response.body);
    //print(data);

    //print(song);

    if (data['recenttracks']["track"][0].containsKey('@attr')) {
      print('Found Song');

      String attr =
          data['recenttracks']["track"][0]["@attr"]["nowplaying"].toString();
      String audio =
          data['recenttracks']["track"][0]["artist"]['#text'].toString();

      //print(audio);

      String name =
          data['recenttracks']["track"][0]["album"]['#text'].toString();

      //print(name);

      String song = data['recenttracks']["track"][0]["name"].toString();
      String img =
          data['recenttracks']["track"][0]["image"][3]["#text"].toString();
      //print(img);
      setState(() {
        Audio = audio;
        Artist = name;
        Song = song;
        isplaying = true;
      });
      if (img ==
          'https://lastfm.freetls.fastly.net/i/u/300x300/2a96cbd8b46e442fc41c2b86b821562f.png')
        setState(() {
          image = 'https://hbflow.github.io/hbflowimages/sorry.png';
        });
      else
        setState(() {
          image = img;

        });
    } else
      setState(() {
        image = 'https://hbflow.github.io/hbflowimages/wfm1.png';
        Audio = '   ';
        Artist = '   ';
        Song = '   ';
        isplaying = false;

      });

    // print(attr);
  }

  Future<void> repeat() async {
    await Future.delayed(Duration(seconds: 3), () {
      getdata();
    });
    print(image);

    repeat();
  }

  @override
  void initState() {
    super.initState();
    getdata();
    repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Center(

          child: Visibility(
            visible: verf == true ? true : false ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(

                          '${Artist}',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xffc7c7c7),
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 3.0,
                                  color: Colors.black54,
                                ),
                              ],
                              fontSize: 40,
                              fontFamily: 'Uberlin'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color(0x82A2A2A),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: OverflowBox(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          child: Image.network(image),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                FittedBox(
                  child: Text(
                    '${Song}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xffc7c7c7),
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),
                        ],
                        fontSize: 40,
                        fontFamily: 'Uberlin'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: isplaying == true ? true : false,
                  child: FittedBox(
                    child: Text(
                      'by',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xffc59f9f),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 3.0,
                              color: Colors.black54,
                            ),
                          ],
                          fontSize: 20,
                          fontFamily: 'Uberlin'),
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    '${Audio}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xffc7c7c7),
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),
                        ],
                        fontSize: 40,
                        fontFamily: 'Uberlin'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: verf == false ? true : false ,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Center(
                  child: Text(
                    'Enter Last.FM Username',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xffc7c7c7),
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),
                        ],
                        fontSize: 30,
                        fontFamily: 'Schyler'),
                  ),
                ),
                SizedBox(height: 20,),
                Container(

                  margin: const EdgeInsets.all(6.0),
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color(0xffc7c7c7),
                      width: 2,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[ Color(0xffa8a1a9),Color(0xffd8d6d8),],
                    ),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    maxLength: 60,
                    onFieldSubmitted: (text) {
                      setState(() {
                        user = text;
                        verf = true;

                      });
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      fontFamily: 'Uberlin',
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

                    decoration: InputDecoration(
                      hintText: "Enter Last.Fm Username",
                      fillColor: Colors.black,


                      focusColor: Colors.black,
                      hoverColor: Colors.black,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
