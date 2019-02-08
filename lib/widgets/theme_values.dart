import 'package:flutter/material.dart';

class ThemeValues {
  static const boxShadow = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(-3, 2),
      blurRadius: 3,
    )
  ];

  static const cardDropShadow = [
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, 3.5),
      blurRadius: 4,
    )
  ];

  static const listDropShadow = [
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, -1.5),
      blurRadius: 7,
    )
  ];

  static const buttonDropShadow = [
    BoxShadow(
      color: Color(0x40000000),
      offset: Offset(0, 1.4),
      blurRadius: 3,
    )
  ];

  static const lightBackground = Color(0xFFF9F8FD);

  static const green = Color(0xFF0ECF5C);
  static const greenDark = Color(0x66000000);
  static const greenFaded = Colors.green;

}

