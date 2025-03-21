import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme {
    const seedColor = Colors.deepPurple;

    return ThemeData(
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor,
      ),
    );
  }
}
