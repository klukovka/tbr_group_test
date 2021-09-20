import 'package:flutter/material.dart';
import 'package:tbr_group_test/src/home_page.dart';
import 'package:tbr_group_test/values/colors.dart';

class PhoneApp extends StatelessWidget {
  const PhoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: theme,
    );
  }

  ThemeData get theme => ThemeData(
        primaryColor: ColorsApp.gray,
        primaryColorDark: ColorsApp.darkGray,
        primaryColorLight: ColorsApp.lightGray,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: ColorsApp.lightBlack,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: ColorsApp.gray,
            fontSize: 16,
          ),
          headline3: TextStyle(
            color: ColorsApp.gray,
            fontSize: 14,
          ),
          headline4: TextStyle(
            color: ColorsApp.darkGray,
            fontSize: 14,
          ),
        ),
      );
}
