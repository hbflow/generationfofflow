import 'package:flutter/material.dart';
import 'package:delayed_widget/delayed_widget.dart';

class fstext extends StatelessWidget {
  final text;

  const fstext({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //The DelayedWidget will be used currently but I will soon create the slide from bottom animation myself
    return DelayedWidget(
      delayDuration: Duration(milliseconds: 200), 
      animationDuration: Duration(seconds: 1), 
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: Center(
        child: Container(
          child: SelectableText(
            '${text}',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: MediaQuery.of(context).size.width / 20,
                fontFamily: 'Schyler'),
          ),
        ),
      ),
    );
  }
}
