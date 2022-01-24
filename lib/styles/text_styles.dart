import 'package:flutter/material.dart';

class TextStyles {
  static double baseFontSize = 18.0;

  static TextStyle commonStyle([double multipleFontSize = 1]) {
    return TextStyle(
      color: Colors.lightBlueAccent,
      fontSize: baseFontSize * multipleFontSize,
      letterSpacing: 1,
      wordSpacing: 2,
      height: 1.2,
    );
  }
}
