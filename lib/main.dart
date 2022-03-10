import 'package:clinic/view/screens/auth/login_screen.dart';
import 'package:clinic/view/screens/auth/signup_screen.dart';
import 'package:clinic/view/screens/home_screen.dart';
import 'package:clinic/view/screens/item/item.dart';
import 'package:flutter/material.dart';

import 'view/screens/category_child/category_child.dart';
import 'view/screens/category_child/categoy_items/category_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clinic Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}
