import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'features/trails/trails_screen.dart';

class TrailBookApp extends StatelessWidget {
  const TrailBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrailBook',
      theme: appTheme,
      home: const TrailsScreen(),
    );
  }
}
