import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:async';

import '../privateinfo.dart';

class last extends StatefulWidget {
  @override
  _lastState createState() => _lastState();
}

class _lastState extends State<last> {
  String g = 'Retrieving Music';
  String image = 'https://i.scdn.co/image/ab67616d0000b2730d3e6cf32db8f4546dc7e755';
  String user = 'Foxx2xs';
  String Audio = 'Waiting for Music';

  void getdata() async {
    Response response = await get(Uri.parse(
        'https://ws.audioscrobbler.com/2.0/?method=user.getRecentTracks&user=$user&limit=1&api_key=$thekey&format=json'));
    Map data = jsonDecode(response.body);
    //print(data);

    String audio =
        data['recenttracks']["track"][0]["artist"]['#text'].toString();

    //print(audio);

    String name = data['recenttracks']["track"][0]["album"]['#text'].toString();

    //print(name);

    String song = data['recenttracks']["track"][0]["name"].toString();

    //print(song);
    String attr =
        data['recenttracks']["track"][0]["@attr"]["nowplaying"].toString();
    print(attr);
    String img =
        data['recenttracks']["track"][0]["image"][3]["#text"].toString();
    print(img);
    setState(() {
      image = img;
      Audio = audio;
    });
  }

  Future<void> repeat() async {
    await Future.delayed(Duration(seconds: 3), () {
      getdata();
    });

    repeat();
  }

  @override
  void initState() {
    super.initState();
    getdata();



  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                  child: Image.network(image),
                )),
            Text('${Audio}')
          ],
        ),
      ),
    );
  }
}
