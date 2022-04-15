import 'package:clinic/view/widgets/auth/auth_button.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class ButtonGradientWidget extends StatelessWidget {
  double width;
  double height;
  String text;
  Color? color;
  VoidCallback? onPressed;

  ButtonGradientWidget(
      {Key? key,
      this.height = 40,
      this.width = 130,
      required this.text,
      this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color(0Xff054F86),
              Color(0Xff61C089),
            ],
            // begin: Alignment.bottomCenter,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10,
              minimumSize: const Size(130, 40),
              primary: color,
              onSurface: Colors.transparent,
              onPrimary: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: onPressed,
          child: TextUtils(
              text: text,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ));
  }
}
