import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String text;
  TitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.blue.shade900,
          ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextUtils(
            text: text,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
