import 'package:flutter/material.dart';
import 'package:irohasu/src/config/base_colors.dart';

final ThemeData iLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final base = ThemeData.light();
  return base.copyWith(
      backgroundColor: AppColors.lighterGrey,
      primaryColor: Colors.black,
      accentColor: Colors.white,
      buttonColor: AppColors.blue,
      canvasColor: Colors.black54,
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
      )
  );
}

final ThemeData iDarkTheme = _buildDarkTheme();
ThemeData _buildDarkTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
      backgroundColor: AppColors.grey,
      primaryColor: Colors.white,
      accentColor: AppColors.black,
      buttonColor: AppColors.lightGreen,
      canvasColor: Colors.white54,
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
      )
  );
}

final ThemeData iBlackTheme = _buildBlackTheme();
ThemeData _buildBlackTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
      backgroundColor: AppColors.black,
      primaryColor: Colors.white,
      accentColor: AppColors.black,
      buttonColor: AppColors.lightGreen,
      canvasColor: Colors.white54,
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
      )
  );
}
