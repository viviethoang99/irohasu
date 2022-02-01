import 'package:flutter/material.dart';

import '../base_colors.dart';

class AppTheme {
  static const String _fontFamily = 'BeVietnamPro';

  static ThemeData get light {
    return ThemeData(
      backgroundColor: AppColors.lighterGrey,
      primaryColor: Colors.black,
      canvasColor: Colors.black54,
      fontFamily: _fontFamily,
      textTheme: ThemeData.light().textTheme.copyWith(
            headline5: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            headline2: const TextStyle(
              color: Colors.black,
            ),
            bodyText1: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            subtitle1: const TextStyle(
              color: Colors.black54,
            ),
            subtitle2: const TextStyle(
              color: AppColors.semiGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      backgroundColor: AppColors.grey,
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      canvasColor: Colors.white54,
      fontFamily: _fontFamily,
      textTheme: ThemeData.dark().textTheme.copyWith(
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
              color: Colors.white54,
            ),
            subtitle2: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }

  static ThemeData get black {
    return ThemeData(
        backgroundColor: AppColors.black,
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        canvasColor: Colors.white54,
        fontFamily: _fontFamily,
        textTheme: ThemeData.dark().textTheme.copyWith(
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
                color: Colors.white54,
              ),
              subtitle2: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ));
  }
}
