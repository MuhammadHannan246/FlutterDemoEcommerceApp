import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';

class ThemeStyle {
  static ThemeData darkTheme = ThemeData(
    splashColor: kTransparentColor,
    splashFactory: NoSplash.splashFactory,
    appBarTheme: AppBarTheme(
      foregroundColor: kBlackColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kSecondarySwatchColor),
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
    actionIconTheme: ActionIconThemeData(
      endDrawerButtonIconBuilder: (context) {
        return Icon(Icons.menu, color: kGrey900Color);
      },
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(kPrimarySwatchColor)),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
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
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: kWhiteColor,
      todayBackgroundColor: WidgetStatePropertyAll(kPrimarySwatchColor),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return kPrimarySwatchColor;
          }
          return kWhiteColor;
        },
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return kPrimarySwatchColor;
          }
          return kGrey900Color;
        },
      ),
      side: WidgetStateBorderSide.resolveWith(
        (Set<WidgetState> states) {
          return BorderSide(color: kPrimarySwatchColor);
        },
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBlackColor,
      selectedItemColor: kWhiteColor,
      unselectedItemColor: kWhiteColor,
    ),
    textTheme: TextTheme(
      displayLarge:
          TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      displayMedium:
          TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      displaySmall:
          TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      headlineLarge:
          TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      headlineMedium:
          TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      headlineSmall:
          TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      titleLarge: TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      titleMedium: TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      titleSmall: TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      bodyLarge: TextStyle(fontFamily: 'poppins', color: kBlackColor),
      bodyMedium: TextStyle(fontFamily: 'poppins', color: kBlackColor),
      bodySmall: TextStyle(fontFamily: 'Poppins', color: kBlackColor),
      labelLarge: TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      labelMedium: TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
      labelSmall: TextStyle(fontFamily: 'PlayfairDisplay', color: kBlackColor),
    ),
  );
}
