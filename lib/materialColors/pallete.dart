//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff1a1a1a, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff1a1a1a), //10%
      100: const Color(0xff333333), //20%
      200: const Color(0xff4d4d4d), //30%
      300: const Color(0xff666666), //40%
      400: const Color(0xff808080), //50%
      500: const Color(0xff999999), //60%
      600: const Color(0xffb3b3b3), //70%
      700: const Color(0xffcccccc), //80%
      800: const Color(0xffe6e6e6), //90%
      900: const Color(0xffffffff), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.
