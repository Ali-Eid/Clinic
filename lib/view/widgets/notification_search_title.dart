import 'package:clinic/l10n/l10n.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/logic/localization/cubit/localization_cubit.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/search/search_screen.dart';
import 'package:clinic/view/widgets/icon_item_search_or_noti.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:clinic/view/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationSearchTitle extends StatelessWidget {
  String text;

  NotificationSearchTitle({Key? key, required this.text}) : super(key: key);
  Locale? locale;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              print('notifications');
            },
            child: IconItemWidget(iconData: Icons.notifications)),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchScreen()));
              print('search');
            },
            child: IconItemWidget(iconData: Icons.search)),
        Row(
          children: [
            TitleWidget(text: text),
            const Spacer(),
            // DropdownButtonHideUnderline(
            //   child: DropdownButton(
            //     icon: Container(
            //       width: 45,
            //       height: 20,
            //       decoration: BoxDecoration(
            //           borderRadius:
            //               AppLocalizations.of(context)!.language == "Arabic"
            //                   ? BorderRadius.only(
            //                       topRight: Radius.circular(10),
            //                       bottomRight: Radius.circular(10))
            //                   : BorderRadius.only(
            //                       topLeft: Radius.circular(10),
            //                       bottomLeft: Radius.circular(10),
            //                     ),
            //           gradient: LinearGradient(
            //             colors: [
            //               Color(0Xff054F86),
            //               Color(0Xff61C089),
            //               // Colors.green.shade400,
            //             ],
            //             begin: Alignment.topCenter,
            //           )),
            //       child: Icon(
            //         Icons.language,
            //         color: Colors.white,
            //         size: 20,
            //       ),
            //     ),
            //     items: L10n.all.map((e) {
            //       final flag = L10n.getFlag(e.languageCode);
            //       return DropdownMenuItem(
            //         child: Center(
            //           child: Text(
            //             flag,
            //             style: TextStyle(
            //               fontSize: 25,
            //             ),
            //           ),
            //         ),
            //         value: e,
            //         onTap: () {
            //           Navigator.of(context).pushAndRemoveUntil(
            //               MaterialPageRoute(builder: (ctxt) => HomeScreen()),
            //               (route) => false);
            //           LocalizationCubit.get(context).setLocale(e);
            //         },
            //       );
            //     }).toList(),
            //     onChanged: (v) {},
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}
