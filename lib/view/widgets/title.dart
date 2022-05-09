import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleWidget extends StatelessWidget {
  String text;
  TitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: AppLocalizations.of(context)!.language == "Arabic"
              ? const BorderRadius.only(topLeft: Radius.circular(30))
              : const BorderRadius.only(topRight: Radius.circular(30)),
          gradient: const LinearGradient(colors: [
            Color(0Xff054F86),
            Color(0Xff61C089),
          ], begin: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextUtils(
            text: text,
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
