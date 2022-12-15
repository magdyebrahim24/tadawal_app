import 'package:flutter/material.dart';
import 'package:tadawal/core/utils/app_colors.dart';
import 'package:tadawal/core/utils/app_strings.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 20),
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondColor) ,
          headline6: TextStyle(fontWeight: FontWeight.w800),
          bodyText1: TextStyle(color: AppColors.secondColor,
              fontWeight: FontWeight.w700, fontSize: 18, height: 1.25),
      subtitle1: TextStyle(
        color: AppColors.secondColor,
      ),
      ));
}
