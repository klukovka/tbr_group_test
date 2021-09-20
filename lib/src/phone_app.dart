import 'package:flutter/material.dart';
import 'package:tbr_group_test/src/home_page.dart';
import 'package:tbr_group_test/values/colors.dart';

const _lowFontSize = 14.0;
const _normalFontSize = 16.0;
const _highFontSize = 24.0;

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
        accentColor: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: ColorsApp.lightBlack,
            fontSize: _highFontSize,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: ColorsApp.gray,
            fontSize: _normalFontSize,
          ),
          headline3: TextStyle(
            color: ColorsApp.gray,
            fontSize: _lowFontSize,
          ),
          headline4: TextStyle(
            color: ColorsApp.darkGray,
            fontSize: _normalFontSize,
          ),
          headline5: TextStyle(
            color: ColorsApp.lightBlack,
            fontSize: _normalFontSize,
          ),
        ),
      );
}
