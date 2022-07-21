import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: Colors.green[900], secondary: Colors.blueAccent[700]),
    appBarTheme: AppBarTheme(backgroundColor: Colors.green[900]),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blueAccent[700]!)),
    ));
