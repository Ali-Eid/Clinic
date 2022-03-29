import 'package:clinic/applocal.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/logic/auth/log_in/cubit/login_cubit.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/services/network/dio_helper.dart';
import 'package:clinic/view/screens/auth/login_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
  runApp(MyApp(
    startwidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget? startwidget;
  MyApp({Key? key, this.startwidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..getCategories()
            ..meInfo(),
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
          home: startwidget),
    );
  }
}
