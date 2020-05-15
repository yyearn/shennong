import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget{
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
        'yyearn' ,
      style: _textStyle,
      textAlign: TextAlign.center,

    );
  }
}