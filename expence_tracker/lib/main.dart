import 'package:expence_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  // seedColor: const Color.fromARGB(255, 64, 14, 178),
  seedColor: const Color.fromARGB(255, 255, 76, 5),
);
//starting with k is for global variables thsi is a convenction

void main() {
  runApp(
    MaterialApp(
      // ignore: deprecated_member_use
      theme: ThemeData().copyWith(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 97, 180, 90),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onSecondaryContainer,
          foregroundColor: kColorScheme.inversePrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          shadowColor: kColorScheme.inversePrimary,
          color: kColorScheme.errorContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        //using themedata here ensures that the text is not changed globaly but only for the ones i want
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kColorScheme.inverseSurface,
              ),
            ),
      ),

      home: const Expenses(),
    ),
  );
}
