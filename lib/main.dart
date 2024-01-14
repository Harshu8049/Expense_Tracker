import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(
        255, 96, 59, 181)); // k is used to set variavle as globally abilabel
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondary,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ), // for button use style from
          ),
          textTheme: TextTheme().copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 18))),
      home: const Expenses(),
    ),
  );
}
