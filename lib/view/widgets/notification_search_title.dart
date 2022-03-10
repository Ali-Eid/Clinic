import 'package:clinic/view/widgets/icon_item_search_or_noti.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:clinic/view/widgets/title.dart';
import 'package:flutter/material.dart';

class NotificationSearchTitle extends StatelessWidget {
  String text;
  NotificationSearchTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              print('notifications');
            },
            child: IconItemWidget(iconData: Icons.notifications)),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  print('search');
                },
                child: IconItemWidget(iconData: Icons.search)),
            Spacer(),
            TitleWidget(text: text)
          ],
        ),
      ],
    );
  }
}
