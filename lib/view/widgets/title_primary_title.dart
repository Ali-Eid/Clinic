import 'package:clinic/applocal.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitlePrimaryWidget extends StatelessWidget {
  String text;
  TitlePrimaryWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          borderRadius: AppLocalizations.of(context)!.language == "Arabic"
              ? BorderRadius.only(topLeft: Radius.circular(30))
              : BorderRadius.only(topRight: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              Color(0Xff054F86),
              Color(0Xff61C089),
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
