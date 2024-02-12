import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(
        255, 96, 59, 181)); // k is used to set variavle as globally abilabel
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);
void main() {
 // WidgetsFlutterBinding.ensureInitialized();
 // SystemChrome.setPreferredOrientations([
  //  DeviceOrientation.portraitUp,
  //]).then((fn) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
        ),
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
              color: kDarkColorScheme.secondary,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer,
              ), // for button use style from
            ),
            textTheme: const TextTheme().copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 18))),
        themeMode: ThemeMode.system, //default
        home: const Expenses(),
      ),
    );
  //});
}
