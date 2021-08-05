import 'package:flutter/material.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'dart:async';
import 'package:hybriidflow/main.dart';

class fstext extends StatefulWidget {
  final text;
  final text2;

  const fstext({key, this.text, this.text2}) : super(key: key);

  @override
  _fstextState createState() => _fstextState();
}

class _fstextState extends State<fstext> {
  double opacityLevel = 0;


  Future<void> playy() async {
    print('c');

    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    });

    print(opacityLevel);
  }

  void initState() {
    super.initState();
    playy();
  }
  

  @override
  Widget build(BuildContext context) {
    //The DelayedWidget will be used currently but I will soon create the slide from bottom animation myself
    return DelayedWidget(
      delayDuration: Duration(milliseconds: 200),
      animationDuration: Duration(seconds: 1),
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Center(
                  child: SelectableText(
                    '${widget.text}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),

                        ],
                        fontSize: MediaQuery.of(context).size.width / 20,
                        fontFamily: 'Schyler'),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(milliseconds: 900),
                child: Center(
                  child: Text(
                    '${widget.text2}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width / 50,
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
            ],
          ),
        ),
      ),
    );
  }
}
