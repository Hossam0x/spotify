import 'package:flutter/material.dart';
import 'package:spotify/core/configs/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(
            color: const Color(0xff383838), fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.all(30),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white, width: 0.4)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.black, width: 0.4)),
      ),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
      fontFamily: 'Satoshi',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));

  static final darkTheme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(
            color: const Color(0xffA7A7A7), fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.all(30),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white, width: 0.4)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white, width: 0.4)),
      ),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));
}
