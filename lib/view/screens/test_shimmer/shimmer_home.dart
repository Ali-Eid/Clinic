import 'package:clinic/view/widgets/grid_custom.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
              text: AppLocalizations.of(context)!.logo,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
              text: AppLocalizations.of(context)!.please_wait,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold)
        ],
      ),
    );
  }
}

class ShimmerLoad extends StatelessWidget {
  const ShimmerLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
              text: AppLocalizations.of(context)!.please_wait,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold)
        ],
      ),
    );
  }
}
