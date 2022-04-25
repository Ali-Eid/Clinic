import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/model/notifications/notifications_model.dart';
import 'package:clinic/view/widgets/header_widget.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: const HeaderWidget(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
            ),
            body: BuildCondition(
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              condition: HomeCubit.get(context).notificationModel != null,
              builder: (context) => Column(
                children: [
                  TextUtils(
                      text: AppLocalizations.of(context)!.notifications,
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return item_notification(
                            notification: HomeCubit.get(context)
                                .notificationModel!
                                .data!
                                .data![index],
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                              height: 1,
                            ),
                        itemCount: HomeCubit.get(context)
                            .notificationModel!
                            .data!
                            .data!
                            .length),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class item_notification extends StatelessWidget {
  DNotification notification;
  item_notification({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: CachedNetworkImageProvider(
            // '${notification.data!.image}',
            'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextUtils(
            text: '${notification.data!.title}',
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          TextUtils(
            text: notification.createdAt!.substring(0, 10),
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
      subtitle: TextUtils(
        text: '${notification.data!.body}',
        color: Colors.grey,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}


































// import 'package:clinic/logic/home/cubit/home_cubit.dart';
// import 'package:clinic/view/widgets/text_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child:
//             // BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
//             //   // TODO: implement listener
//             // }, builder: (context, state) {
//             //   return
//             Scaffold(
//                 appBar: AppBar(
//                   title: const Text('Notifications'),
//                 ),
//                 body: Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                           itemCount:
//                               HomeCubit.get(context).datanotifications.length,
//                           itemBuilder: (ctxt, index) {
//                             return ListTile(
//                               title: TextUtils(
//                                 text:
//                                     '${HomeCubit.get(context).datanotifications[index]!.name}',
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                               subtitle: TextUtils(
//                                 text:
//                                     '${HomeCubit.get(context).datanotifications[index]!.body}',
//                                 color: Colors.grey.shade300,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             );
//                           }),
//                     )
//                   ],
//                 ))
//         // );
//         // }),
//         );
//   }
// }





































// // import 'package:clinic/main.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // class NotificationScreen extends StatefulWidget {
// //   const NotificationScreen({Key? key}) : super(key: key);

// //   @override
// //   State<NotificationScreen> createState() => _NotificationScreenState();
// // }

// // class _NotificationScreenState extends State<NotificationScreen> {
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //       RemoteNotification notification = message.notification!;
// //       AndroidNotification? android = message.notification?.android;
// //       print('ttttttttttttttttttttttt');
// //       print(notification);
// //       print(android);
// //       // If `onMessage` is triggered with a notification, construct our own
// //       // local notification to show to users using the created channel.
// //       flutterLocalNotificationsPlugin.show(
// //         notification.hashCode,
// //         notification.title,
// //         notification.body,
// //         NotificationDetails(
// //           android: AndroidNotificationDetails(
// //             channel.id, channel.name,
// //             channelDescription: channel.description,
// //             icon: '@mipmap/ic_launcher',
// //             color: Colors.blue,
// //             playSound: true,
// //             importance: Importance.max,
// //             // enableLights: true,
// //             // largeIcon:
// //             //     const DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
// //             enableVibration: true,
// //             priority: Priority.high,
// //             fullScreenIntent: true,
// //             timeoutAfter: 2,
// //             // styleInformation: const MediaStyleInformation(
// //             //     htmlFormatContent: true, htmlFormatTitle: true),
// //           ),
// //         ),
// //       );
// //     });

// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //       RemoteNotification? notification = message.notification;
// //       AndroidNotification? android = message.notification?.android;

// //       if (notification != null && android != null) {
// //         showDialog(
// //             context: context,
// //             builder: (_) {
// //               return AlertDialog(
// //                 title: Text('${notification.title}'),
// //                 content: SingleChildScrollView(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text('${notification.body}'),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             });
// //       }
// //     });
// //   }

// //   void showNotifications() {
// //     flutterLocalNotificationsPlugin.show(
// //       0,
// //       'Testing',
// //       'how r u',
// //       NotificationDetails(
// //         android: AndroidNotificationDetails(
// //           channel.id, channel.name,
// //           channelDescription: channel.description,
// //           icon: '@mipmap/ic_launcher',
// //           color: Colors.blue,
// //           playSound: true,
// //           importance: Importance.max,
// //           // enableLights: true,
// //           // largeIcon:
// //           //     const DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
// //           enableVibration: true,
// //           priority: Priority.high,
// //           fullScreenIntent: true,
// //           timeoutAfter: 2,

// //           // usesChronometer: true,

// //           // styleInformation: const MediaStyleInformation(
// //           //     htmlFormatContent: true, htmlFormatTitle: true),
// //         ),
// //       ),
// //       // payload: 'ddd',
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: const Center(
// //         child: Text('Notifications'),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: showNotifications,
// //         child: const Icon(
// //           Icons.add,
// //         ),
// //       ),
// //     );
// //   }
// // }