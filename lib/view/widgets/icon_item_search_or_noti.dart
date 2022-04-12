import 'package:clinic/applocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IconItemWidget extends StatelessWidget {
  IconData iconData;
  IconItemWidget({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: AppLocalizations.of(context)!.language == "Arabic"
              ? BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))
              : BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
          gradient: LinearGradient(
            colors: [
              Color(0Xff054F86),
              Color(0Xff61C089),
              // Colors.green.shade400,
            ],
            begin: Alignment.topCenter,
          )),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
