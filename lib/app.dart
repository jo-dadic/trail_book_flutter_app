import 'package:flutter/material.dart';

import 'features/trails/trails_screen.dart';

class TrailBookApp extends StatelessWidget {
  const TrailBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF1F5C3A);
    const softGreen = Color(0xFF7EA16B);
    const warmBackground = Color.fromARGB(255, 213, 223, 197);
    const cardColor = Color(0xFFFFFCF7);
    const darkText = Color(0xFF1F261F);

    const colorScheme = ColorScheme.light(
      primary: primaryGreen,
      onPrimary: Colors.white,
      secondary: softGreen,
      onSecondary: Colors.white,
      surface: cardColor,
      onSurface: darkText,
      error: Color(0xFFB3261E),
    );

    return MaterialApp(
      title: 'TrailBook',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: warmBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryGreen,
          foregroundColor: cardColor,
          centerTitle: false,
          elevation: 0,
          iconTheme: IconThemeData(color: cardColor),
          titleTextStyle: TextStyle(
            color: cardColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardThemeData(
          color: cardColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(color: darkText, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: darkText),
          bodyMedium: TextStyle(color: darkText),
          labelMedium: TextStyle(color: softGreen, fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: cardColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          labelStyle: const TextStyle(color: darkText),
          floatingLabelStyle: const TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: softGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primaryGreen, width: 2),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primaryGreen,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const TrailsScreen(),
    );
  }
}
