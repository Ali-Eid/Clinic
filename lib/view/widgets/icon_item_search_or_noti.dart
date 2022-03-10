import 'package:flutter/material.dart';

class IconItemWidget extends StatelessWidget {
  IconData iconData;
  IconItemWidget({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.blue.shade900,
          ])),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
