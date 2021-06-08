import 'package:flutter/material.dart';

class fstext extends StatelessWidget {
  final text;

  const fstext({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SelectableText(
          '${text}',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width / 20),
        ),
      ),
    );
  }
}
