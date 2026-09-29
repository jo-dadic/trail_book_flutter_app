import 'package:flutter/material.dart';

import 'mock/mock_trails.dart';
import 'trail_card.dart';
import 'trail_details_screen.dart';

class TrailsScreen extends StatelessWidget {
  const TrailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrailBook'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockTrails.length,
        itemBuilder: (context, index) {
          final trail = mockTrails[index];

          return TrailCard(
            trail: trail,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrailDetailsScreen(trail: trail),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
