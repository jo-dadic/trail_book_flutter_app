import 'package:flutter/material.dart';

import 'trail.dart';

class TrailCard extends StatelessWidget {
  const TrailCard({super.key, required this.trail, required this.onTap});

  final Trail trail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final difficultyBackgroundColor = switch (trail.difficulty) {
      TrailDifficulty.easy => const Color(0xFFE0F2E4),
      TrailDifficulty.moderate => const Color(0xFFFFE8CC),
      TrailDifficulty.hard => const Color(0xFFFFD8D6),
    };
    final difficultyTextColor = switch (trail.difficulty) {
      TrailDifficulty.easy => const Color(0xFF1F6B3A),
      TrailDifficulty.moderate => const Color(0xFF9A5A00),
      TrailDifficulty.hard => const Color(0xFFB3261E),
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: double.infinity, // uzmi maksimalnu širinu dostupnog prostora
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trail.name,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.place, color: colorScheme.secondary, size: 18),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        trail.location,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.hiking, color: colorScheme.primary, size: 20),
                    const SizedBox(width: 8),
                    Text('${trail.distanceKm} km', style: textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.schedule, color: colorScheme.primary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '${trail.durationMinutes} min',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.terrain, color: colorScheme.primary, size: 20),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: difficultyBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        trail.difficulty.name,
                        style: textTheme.bodyMedium?.copyWith(
                          color: difficultyTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
