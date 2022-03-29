import 'package:clinic/applocal.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class TitlePrimaryWidget extends StatelessWidget {
  String text;
  TitlePrimaryWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          borderRadius: AppLocale.of(context).locale!.languageCode == "ar"
              ? BorderRadius.only(topLeft: Radius.circular(30))
              : BorderRadius.only(topRight: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.blue.shade900,
            ],
          ),
          color: Colors.transparent.withOpacity(0.60)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextUtils(
            text: text,
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
