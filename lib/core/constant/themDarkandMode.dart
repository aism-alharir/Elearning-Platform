import 'package:flutter/material.dart';


class ThemeEdite {
  static final ThemeData dark = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Cairo',
        ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.grey.withOpacity(0.4),
      fillColor: Colors.grey.withOpacity(0.4),
      hintStyle: const TextStyle(
        fontFamily: "Cairo",
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
    ),
    hintColor: Colors.white,
    appBarTheme: const AppBarTheme(
        color: Color(0xffc385c7), elevation: 0.0, centerTitle: true),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Cairo',
        ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
        hintStyle: const TextStyle(
          fontFamily: "Cairo",
          fontWeight: FontWeight.normal,
          fontSize: 16,
        )),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.white),
          )
        ),
    appBarTheme: const AppBarTheme(
        color: Color(0xffc385c7), elevation: 0.0, centerTitle: true),
  );
}