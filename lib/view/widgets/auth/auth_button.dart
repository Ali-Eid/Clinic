// import 'package:e_commerce/utils/theme.dart';
// import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  String text;
  Color? color;
  VoidCallback? onPressed;
  AuthButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 10,
          minimumSize: Size(130, 40),
          primary: color,
          onSurface: Colors.transparent,
          onPrimary: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: onPressed,
      child: TextUtils(
          text: text,
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }
}
