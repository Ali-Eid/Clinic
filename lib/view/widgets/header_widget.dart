import 'package:clinic/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        const Image(
          matchTextDirection: true,
          image: AssetImage('assets/images/xxxxxxx (1).png'),
          fit: BoxFit.fill,
          height: 60,
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          alignment: AlignmentDirectional.centerEnd,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false);
            },
            child: const Image(
              image: AssetImage(
                'assets/images/xxxxxxx (2).png',
              ),
              // width: 40,
              height: 40,
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
