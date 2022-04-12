import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/auth/cubit/auth_cubit.dart';

import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/logic/localization/cubit/localization_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/services/network/dio_helper.dart';
import 'package:clinic/shared/bloc_observe.dart';
import 'package:clinic/view/screens/auth/login_screen.dart';
import 'package:clinic/view/screens/category_child/categoy_items/item_category.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/home_screen_2.dart';
import 'package:clinic/view/widgets/text_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'view/screens/auth/signup_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  token = CacheHelper.getData(key: 'token');
  print('token :  ${token}');

  if (token != null) {
    widget = HomeScreen();
  } else {
    widget = LoginScreen();
  }
  String locale = CacheHelper.getData(key: 'lang') ?? 'en';
  print('locale :  ${locale}');
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startwidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class SplashScreen extends StatelessWidget {
  Widget? startWidget;

  SplashScreen({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'))),
          ),
          TextUtils(
              text: '${AppLocalizations.of(context)!.logo}',
              color: Color(0Xff054F86),
              fontSize: 23,
              fontWeight: FontWeight.bold)
        ],
      ),

      nextScreen: startWidget!,
      splashTransition: SplashTransition.fadeTransition,
      // splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.leftToRightWithFade,
      splashIconSize: 250,
      disableNavigation: false,
      duration: 3000,
      animationDuration: Duration(seconds: 3),
      centered: true,

      // backgroundColor: Colors.red,
    );
  }
}

class MyApp extends StatelessWidget {
  Widget? startwidget;
  String? locale;
  MyApp({Key? key, this.startwidget, this.locale}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit()
            ..getCities()
            ..getSpecialist(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()
            ..meInfo()
            ..getCategories()
            ..getcart()
            ..getContactinfo()
            ..getCities(),
        ),
        BlocProvider(
          create: (context) => LocalizationCubit(),
        ),
        // BlocProvider(create: (context) => LoginCubit()),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Clinic Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: LocalizationCubit.get(context).locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [
              Locale("en", ""),
              Locale("ar", ""),
            ],
            // localeResolutionCallback: (locale, supportedLocales) {
            //   if (locale != null) {
            //     for (Locale local in supportedLocales) {
            //       if (local.languageCode == locale.languageCode) {
            //         return locale;
            //       }
            //     }
            //   }
            //   return supportedLocales.first;
            // },
            debugShowCheckedModeBanner: false,
            home: SplashScreen(
              startWidget: startwidget,
            ),
          );
        },
      ),
    );
  }
}
