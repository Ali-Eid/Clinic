import 'package:flutter/material.dart';

class FotterWidget extends StatelessWidget {
  const FotterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Image(
          matchTextDirection: true,
          image: AssetImage('assets/images/88.png'),
          fit: BoxFit.fill,
        ));
  }
}
