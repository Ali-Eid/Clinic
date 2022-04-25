import 'package:clinic/l10n/l10n.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/logic/localization/cubit/localization_cubit.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/notifications/notifications_screen.dart';
import 'package:clinic/view/screens/search/search_screen.dart';
import 'package:clinic/view/widgets/icon_item_search_or_noti.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:clinic/view/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationSearchTitleHome extends StatelessWidget {
  String text;

  NotificationSearchTitleHome({Key? key, required this.text}) : super(key: key);
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
              // HomeCubit.get(context).getNotifications();
              // print('${HomeCubit.get(context).datanotifications.length}');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const NotificationScreen()));
              // HomeCubit.get(context).shownotifications();
            },
            child: IconItemWidget(iconData: Icons.notifications)),
        // HomeCubit.get(context)
        //         .notificationModel!
        //         .data!
        //         .data!
        //         .isNotEmpty
        //     ? Container(
        //         width: 45,
        //         height: 20,
        //         decoration: BoxDecoration(
        //             borderRadius:
        //                 AppLocalizations.of(context)!.language == "Arabic"
        //                     ? const BorderRadius.only(
        //                         topRight: Radius.circular(10),
        //                         bottomRight: Radius.circular(10))
        //                     : const BorderRadius.only(
        //                         topLeft: Radius.circular(10),
        //                         bottomLeft: Radius.circular(10),
        //                       ),
        //             gradient: const LinearGradient(
        //               colors: [
        //                 Color(0Xff054F86),
        //                 Color(0Xff61C089),
        //                 // Colors.green.shade400,
        //               ],
        //               begin: Alignment.topCenter,
        //             )),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Icon(
        //               Icons.notifications_active,
        //               color: Colors.white,
        //               size: 15,
        //             ),
        //             const SizedBox(
        //               width: 2,
        //             ),
        //             CircleAvatar(
        //               radius: 7,
        //               backgroundColor: Colors.red,
        //               child: Text(
        //                 '${HomeCubit.get(context).notificationModel!.data!.data!.length}',
        //                 style: const TextStyle(fontSize: 10),
        //               ),
        //             )
        //           ],
        //         ))
        // :
        // IconItemWidget(iconData: Icons.notifications)),
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
            DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: Container(
                  width: 45,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius:
                          AppLocalizations.of(context)!.language == "Arabic"
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
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                items: L10n.all.map((e) {
                  final flag = L10n.getFlag(e.languageCode);
                  return DropdownMenuItem(
                    child: Center(
                      child: Text(
                        flag,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    value: e,
                    onTap: () {
                      LocalizationCubit.get(context).setLocale(e);
                    },
                  );
                }).toList(),
                onChanged: (v) {},
              ),
            )
          ],
        ),
      ],
    );
  }
}
