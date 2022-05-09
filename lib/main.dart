// import 'dart:convert';
// import 'dart:js';
import 'dart:convert';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/logic/localization/cubit/localization_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/services/network/dio_helper.dart';
import 'package:clinic/services/notifications/notifications_service.dart';
import 'package:clinic/shared/bloc_observe.dart';
import 'package:clinic/view/screens/auth/login_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/notifications/notifications_screen.dart';
import 'package:clinic/view/widgets/text_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/screens/splash/splash_screen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // if (message.notification != null) {
  CacheHelper.getData(key: 'lang') == 'en'
      ? AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: message.hashCode,
              channelKey: 'basic_channel_img',
              title: message.data['title_en'],
              body: message.data['body_en'],
              // fullScreenIntent: true,
              // largeIcon: 'assets/images/logo.png',
              bigPicture: '$urlimg${message.data['image']}',
              notificationLayout: NotificationLayout.BigPicture,
              wakeUpScreen: true,
              payload: {'screen': '${message.data['screen']}'}),
        )
      : AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: message.hashCode,
              channelKey: 'basic_channel_img',
              title: message.data['title_ar'],
              body: message.data['body_ar'],

              // fullScreenIntent: true,
              // largeIcon: 'assets/images/logo.png',
              bigPicture: '$urlimg${message.data['image']}',
              notificationLayout: NotificationLayout.BigPicture,
              wakeUpScreen: true,
              payload: {'screen': '${message.data['screen']}'}),
        );
  // }

  // flutterLocalNotificationsPlugin.show(
  //   message.notification!.hashCode,
  //   message.notification!.title,
  //   message.notification!.body,
  //   NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       channel.id, channel.name,
  //       channelDescription: channel.description,
  //       icon: '@mipmap/ic_launcher',
  //       color: Colors.blue,
  //       playSound: true,
  //       importance: Importance.max,
  //       // enableLights: true,
  //       // largeIcon:
  //       //     const DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
  //       enableVibration: true,
  //       priority: Priority.high,
  //       fullScreenIntent: true,
  //       //
  //       indeterminate: true,
  //       setAsGroupSummary: true,
  //       visibility: NotificationVisibility.public,
  //       // timeoutAfter: 2,
  //       styleInformation: BigPictureStyleInformation(FilePathAndroidBitmap('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg'))
  //     ),
  //   ),
  // );
//-----------------------------------------------------
  // AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //         id: message.hashCode,
  //         channelKey: 'basic_channel',
  //         title: message.notification!.title,
  //         body: message.notification!.body,
  //         fullScreenIntent: true,
  //         // largeIcon: 'assets/images/logo.png',
  //         // bigPicture: '${message.data.image}',
  //         notificationLayout: NotificationLayout.Default
  //         //  locked: true,
  //         // roundedBigPicture: true,
  //         // displayOnForeground: true,
  //         // wakeUpScreen: true,
  //         // criticalAlert: true,
  //         // displayOnBackground: true,

  //         // autoDismissible: true,
  //         ));
  print('A bg Message just showed up : ${message.messageId}');
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await DioHelper.init();
  await CacheHelper.init();
  await NotificationService().init();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messageToken = await messaging.getToken();
  await CacheHelper.saveData(key: 'token_msg', value: messageToken);
  print('Token_Msg : ${CacheHelper.getData(key: 'token_msg')}');

  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      // NotificationChannel(
      //   channelGroupKey: 'basic_channel_group',
      //   channelKey: 'basic_channel',
      //   channelName: 'Basic notifications',
      //   channelDescription: 'Notification channel for basic tests',
      //   defaultColor: const Color(0xFF9D50DD),
      //   ledColor: Colors.white,
      //   playSound: true,
      //   importance: NotificationImportance.High,
      // ),
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel_img',
        channelName: 'Basic notifications img',
        channelDescription: 'Notification channel for basic tests with img',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        // soundSource: 'resource://raw/arrive',
        playSound: true,
        importance: NotificationImportance.High,
      )
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupkey: 'basic_channel_group',
          channelGroupName: 'Basic group')
    ],
    debug: true,
  );
  AwesomeNotifications().actionStream.listen((event) {
    var data = event.toMap();
    print('test notifications${data['payload']}');
    if (data['payload']['screen'] == 'NotificationScreen') {
      Navigator.push(navigatorKey.currentState!.context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()));
    } else {
      Navigator.push(navigatorKey.currentState!.context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  Widget widget;
  token = CacheHelper.getData(key: 'token');
  print('token :  $token');

  if (token != null) {
    widget = const HomeScreen();
  } else {
    widget = LoginScreen();
  }
  locale = CacheHelper.getData(key: 'lang') ?? 'en';
  print('locale :  $locale');
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startwidget: widget,
        locale: locale,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  Widget? startwidget;
  String? locale;
  MyApp({Key? key, this.startwidget, this.locale}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..meInfo()
              ..getCategories()
              ..getcart()
              ..getContactinfo()
              ..getNotifications()
            // ..getCities(),
            ),
        BlocProvider(
          create: (context) => LocalizationCubit()..setLocale(Locale(locale!)),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context) => MaterialApp(
              navigatorKey: navigatorKey,
              useInheritedMediaQuery: true,
              title: 'Clinic Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              locale: LocalizationCubit.get(context).locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: const [
                Locale("en", ""),
                Locale("ar", ""),
              ],
              debugShowCheckedModeBanner: false,
              home: SplashScreen(startWidget: startwidget),
            ),
          );
        },
      ),
    );
  }
}
