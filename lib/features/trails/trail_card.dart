import 'package:flutter/material.dart';

import 'trail.dart';

class TrailCard extends StatelessWidget {
  const TrailCard({
    super.key,
    required this.trail,
    required this.onTap,
  });

  final Trail trail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trail.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(trail.location),
              const SizedBox(height: 12),
              Text('Distance: ${trail.distanceKm} km'),
              Text('Duration: ${trail.durationMinutes} min'),
              Text('Difficulty: ${trail.difficulty.name}'),
            ],
          ),
        ),
      ),
    );
  }
}
