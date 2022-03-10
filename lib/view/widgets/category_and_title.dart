import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CategoryandTitle extends StatelessWidget {
  String text;
  String imgurl;
  double width;
  double height;
  GestureTapCallback? ontap;
  CategoryandTitle(
      {Key? key,
      required this.text,
      required this.imgurl,
      required this.ontap,
      this.width = 80,
      this.height = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.blue.shade900,
                ]),
                borderRadius: BorderRadius.circular(20)),
            child: Image(image: AssetImage(imgurl)),
          ),
        ),
        TextButton(
            onPressed: ontap,
            child: TextUtils(
              text: text,
              color: Colors.blue.shade900,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
