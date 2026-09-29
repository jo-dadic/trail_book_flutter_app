import 'package:flutter/material.dart';

import 'trail.dart';
import 'trail_info_item.dart';

class TrailDetailsScreen extends StatelessWidget {
  const TrailDetailsScreen({
    super.key,
    required this.trail,
  });

  final Trail trail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trail.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            trail.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          TrailInfoItem(
            label: 'Location',
            value: trail.location,
          ),
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
          ),
          TrailInfoItem(
            label: 'Description',
            value: trail.description,
          ),
        ],
      ),
    );
  }
}
