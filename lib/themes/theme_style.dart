import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';

class ThemeStyle {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: kWhiteColor,
    splashColor: kTransparentColor,
    splashFactory: NoSplash.splashFactory,
    appBarTheme: AppBarTheme(
      foregroundColor: kBlackColor,
      color: kWhiteColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(kWhiteColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: kWhiteColor),
        ),
        elevation: const WidgetStatePropertyAll(0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevation: const WidgetStatePropertyAll(0),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: kWhiteColor),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: kWhiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBlackColor,
      selectedItemColor: kWhiteColor,
      unselectedItemColor: kWhiteColor,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      displayMedium: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      displaySmall: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      headlineLarge: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      headlineMedium: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      headlineSmall: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      titleLarge: TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      titleMedium: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      titleSmall: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      bodyLarge: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      bodyMedium: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      bodySmall: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      labelLarge: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      labelMedium: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      labelSmall: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
    ),
  );
}
