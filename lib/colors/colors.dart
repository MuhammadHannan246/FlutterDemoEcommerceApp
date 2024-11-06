import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFFE2C57);
MaterialColor kPrimarySwatchColor = MaterialColor(
  kPrimaryColor.value,
  const <int, Color>{
    50: Color(0xFFFE2C57),
    100: Color(0xFFFE2C57),
    200: Color(0xFFFE2C57),
    300: Color(0xFFFE2C57),
    400: Color(0xFFFE2C57),
    500: kPrimaryColor,
    600: Color(0xFFFE2C57),
    700: Color(0xFFFE2C57),
    800: Color(0xFFFE2C57),
    900: Color(0xFFFE2C57),
    1000: Color(0xFFFE2C57),
  },
);

Color kSecondaryColor = const Color(0xFF800020);
MaterialColor kSecondarySwatchColor = MaterialColor(
  kSecondaryColor.value,
  <int, Color>{
    50: const Color(0xFF800020),
    100: const Color(0xFF800020),
    200: const Color(0xFF800020),
    300: const Color(0xFF800020),
    400: const Color(0xFF800020),
    500: kSecondaryColor,
    600: const Color(0xFF800020),
    700: const Color(0xFF800020),
    800: const Color(0xFF800020),
    900: const Color(0xFF800020),
    1000: const Color(0xFF800020),
  },
);

Color kWhiteColor = Colors.white;
Color kWhite38Color = Colors.white38;
Color kWhite70Color = Colors.white70;

Color kBlackColor = Colors.black;
Color kBlack54Color = Colors.black54;

Color kGreyColor = Colors.grey;
Color kGrey800Color = Colors.grey.shade800;
Color kGrey900Color = Colors.grey.shade900;

Color kTransparentColor = Colors.transparent;

Color kGreenColor = Colors.green;
Color kCyanColor = Colors.cyan;
Color kBlueColor = Colors.blue;
Color kRedColor = Colors.red;
Color kAmberColor = Colors.amber;
