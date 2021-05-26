import 'package:flutter/material.dart';

mixin ThemeApp {
  static ThemeData get light => ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        accentColor: Colors.red,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.red),
        buttonColor: Colors.red,
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
          headline2: TextStyle(color: Colors.black87, fontSize: 15),
        ),
      );
}
