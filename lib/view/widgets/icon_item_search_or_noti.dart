import 'package:clinic/applocal.dart';
import 'package:flutter/material.dart';

class IconItemWidget extends StatelessWidget {
  IconData iconData;
  IconItemWidget({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: AppLocale.of(context).locale!.languageCode == "ar"
              ? BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))
              : BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
          gradient: LinearGradient(colors: [
            Colors.blue.shade900,
            Colors.green.shade400,
          ], begin: Alignment.bottomCenter)),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
