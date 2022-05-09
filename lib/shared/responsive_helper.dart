import 'package:flutter/material.dart';

class ResponsiveHelper extends StatelessWidget {
  Widget? mobile;
  Widget? tab;
  ResponsiveHelper({Key? key, this.mobile, this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 768) {
        return mobile!;
      } else {
        return tab!;
      }
    });
  }
}
