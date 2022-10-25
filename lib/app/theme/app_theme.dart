import 'package:flutter/material.dart';

class AppTheme {
  final BorderRadius borderRadius = BorderRadius.circular(8);
  final Color colorPrimary = const Color.fromARGB(255, 9, 74, 139);

  ThemeData get materialTheme {
    return ThemeData(primaryColor: colorPrimary);
  }
}
