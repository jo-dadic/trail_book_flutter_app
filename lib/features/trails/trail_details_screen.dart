import 'package:flutter/material.dart';

import 'trail.dart';
import 'trail_info_item.dart';

class TrailDetailsScreen extends StatelessWidget {
  const TrailDetailsScreen({super.key, required this.trail});

  final Trail trail;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Trail details')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(
            trail.name,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trail information', style: textTheme.titleMedium),
                  const SizedBox(height: 14),
                  TrailInfoItem(label: 'Location', value: trail.location),
                  TrailInfoItem(
                    label: 'Distance',
                    value: '${trail.distanceKm} km',
                  ),
                  TrailInfoItem(
                    label: 'Duration',
                    value: '${trail.durationMinutes} min',
                  ),
                  TrailInfoItem(
                    label: 'Elevation gain',
                    value: '${trail.elevationGainMeters} m',
                  ),
                  TrailInfoItem(
                    label: 'Difficulty',
                    value: trail.difficulty.name,
                    showBottomSpacing: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: TrailInfoItem(
                label: 'Description',
                value: trail.description,
                showBottomSpacing: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
