import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  TextDecoration decoration;
  TextUtils(
      {Key? key,
      required this.text,
      this.decoration = TextDecoration.none,
      required this.color,
      required this.fontSize,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
