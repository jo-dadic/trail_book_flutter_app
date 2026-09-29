import 'package:flutter/material.dart';

import 'features/trails/trails_screen.dart';

class TrailBookApp extends StatelessWidget {
  const TrailBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrailBook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const TrailsScreen(),
    );
  }
}
