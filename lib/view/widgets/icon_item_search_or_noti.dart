import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IconItemWidget extends StatelessWidget {
  IconData iconData;
  IconItemWidget({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.1,
      height: height * 0.035,
      decoration: BoxDecoration(
          borderRadius: AppLocalizations.of(context)!.language == "Arabic"
              ? const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))
              : const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
          gradient: const LinearGradient(
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
