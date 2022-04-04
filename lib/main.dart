import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/applocal.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/auth/cubit/auth_cubit.dart';

import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/services/network/dio_helper.dart';
import 'package:clinic/shared/bloc_observe.dart';
import 'package:clinic/view/screens/auth/login_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/home_screen_2.dart';
import 'package:clinic/view/widgets/text_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'view/screens/auth/signup_screen.dart';

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
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return AnimatedSplashScreen(
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'))),
              ),
              SizedBox(
                height: 10,
              ),
              TextUtils(
                  text: 'My Clinic',
                  color: Color(0Xff054F86),
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ],
          ),
          nextScreen: BuildCondition(
              fallback: (context) => Center(child: CircularProgressIndicator()),
              condition: HomeCubit.get(context).contactInfoModel != null &&
                  HomeCubit.get(context).model != null,
              builder: (context) => startWidget!),
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
      },
    );
  }
}

class MyApp extends StatelessWidget {
  Widget? startwidget;
  MyApp({Key? key, this.startwidget}) : super(key: key);
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
            ..getcart()
            ..getContactinfo()
            ..getCategories(),
        ),
        // BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        title: 'Clinic Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale("en", ""),
          Locale("ar", ""),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale != null) {
            for (Locale local in supportedLocales) {
              if (local.languageCode == locale.languageCode) {
                return locale;
              }
            }
          }
          return supportedLocales.first;
        },
        home: SplashScreen(
          startWidget: startwidget,
        ),
      ),
    );
  }
}
