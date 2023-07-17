import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {50: Color.fromRGBO(0, 0, 0, 0.1)};

abstract class CustomColors {
  static Color customConstrastcolor = Colors.yellow.shade700;
  static MaterialColor customSwatchColor =
      MaterialColor(0xff000000, _swatchOpacity);
}
