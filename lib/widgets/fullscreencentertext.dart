import 'package:flutter/material.dart';
import 'package:delayed_widget/delayed_widget.dart';

class fstext extends StatefulWidget {
  final text;
  final text2;

  const fstext({Key key, this.text, this.text2}) : super(key: key);

  @override
  _fstextState createState() => _fstextState();
}

class _fstextState extends State<fstext> {
  @override
  Widget build(BuildContext context) {
    double opacityLevel = 0;

    void _changeOpacity() {
      setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    }

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
              SelectableText(
                '${widget.text}',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width / 20,
                    fontFamily: 'Schyler'),
              ),
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 3),
                child: Text(
                  '${widget.text2}',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.width / 50,
                      fontFamily: 'Schyler'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
