import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  ImageProvider image;
  String name;
  GestureTapCallback ontap;

  CategoryItemWidget(
      {Key? key, required this.image, required this.name, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: ontap,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: 165,
              height: 165,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // border: Border.all(width: 1),
                gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.blue.shade900,
                ], begin: Alignment.topLeft, end: Alignment.topRight),
              ),
              child: Container(
                width: 160,
                height: 160,
                color: Colors.white,
                child: Image(
                  image: AssetImage('assets/images/demo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 110,
              height: 25,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.green,
                    Colors.blue.shade900,
                  ], begin: Alignment.topLeft, end: Alignment.topRight),
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30))),
              child: TextUtils(
                  text: name,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
