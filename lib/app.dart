import 'package:flutter/material.dart';

class TrailBookApp extends StatelessWidget {
  const TrailBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrailBook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('TrailBook')),
        body: const Center(child: Text('TrailBook app')),
      ),
    );
  }
}
