import 'package:flutter/material.dart';

import './base_colors.dart';

enum AppTheme { white, dark, black }

final appThemeData = {
  AppTheme.white: ThemeData(
      brightness: Brightness.light,
      backgroundColor: AppColors.lighterGrey,
      primaryColor: Colors.black,
      accentColor: Colors.white,
      buttonColor: AppColors.blue,
      canvasColor: Colors.black54,
      fontFamily: 'OpenSans',
      textTheme: ThemeData.light().textTheme.copyWith(
            headline5: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            headline2: const TextStyle(
              color: Colors.black,
            ),
            bodyText1: const TextStyle(color: Colors.black, fontSize: 16),
            subtitle1: const TextStyle(
              color: Colors.black54,
            ),
            subtitle2: const TextStyle(
              color: AppColors.semiGrey,
              fontWeight: FontWeight.bold,
            ),
          )),
  AppTheme.dark: ThemeData(
      brightness: Brightness.dark,
      backgroundColor: AppColors.grey,
      primaryColor: Colors.white,
      accentColor: AppColors.black,
      buttonColor: AppColors.lightGreen,
      canvasColor: Colors.white54,
      fontFamily: 'OpenSans',
      textTheme: ThemeData.light().textTheme.copyWith(
            headline5: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            headline2: const TextStyle(
              color: Colors.white,
            ),
            bodyText1: const TextStyle(
              color: Colors.white,
            ),
            subtitle1: const TextStyle(
              color: Colors.white54,
            ),
            subtitle2: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
  AppTheme.black: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      backgroundColor: Colors.black87,
      accentColor: AppColors.black,
      buttonColor: AppColors.lightBlue,
      canvasColor: Colors.white54,
      fontFamily: 'OpenSans',
      textTheme: ThemeData.light().textTheme.copyWith(
            headline5: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline2: const TextStyle(
              color: Colors.white,
            ),
            bodyText1: const TextStyle(
              color: Colors.white,
            ),
            subtitle1: const TextStyle(
              color: AppColors.black,
            ),
            subtitle2: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ))
};
