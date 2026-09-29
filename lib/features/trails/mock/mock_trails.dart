import '../trail.dart';

const mockTrails = [
  Trail(
    id: 'sljeme-loop',
    name: 'Sljeme Loop',
    location: 'Medvednica, Croatia',
    distanceKm: 12.5,
    durationMinutes: 240,
    elevationGainMeters: 720,
    difficulty: TrailDifficulty.moderate,
    description: 'Forest loop above Zagreb with a steady climb and city views.',
    imageUrl:
        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
    isFavorite: true,
  ),
  Trail(
    id: 'premuzic-trail',
    name: 'Premuzic Trail',
    location: 'Velebit, Croatia',
    distanceKm: 57,
    durationMinutes: 1080,
    elevationGainMeters: 1600,
    difficulty: TrailDifficulty.hard,
    description: 'A classic mountain route through Northern Velebit.',
    imageUrl:
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b',
  ),
  Trail(
    id: 'plitvice-boardwalk',
    name: 'Plitvice Boardwalk',
    location: 'Plitvice Lakes, Croatia',
    distanceKm: 8,
    durationMinutes: 150,
    elevationGainMeters: 180,
    difficulty: TrailDifficulty.easy,
    description: 'A scenic walk through lakes, waterfalls, and wooden paths.',
    imageUrl:
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
  ),
  Trail(
    id: 'paklenica-canyon',
    name: 'Paklenica Canyon',
    location: 'Starigrad, Croatia',
    distanceKm: 14,
    durationMinutes: 300,
    elevationGainMeters: 650,
    difficulty: TrailDifficulty.moderate,
    description: 'Rocky canyon trail surrounded by dramatic cliffs.',
    imageUrl:
        'https://images.unsplash.com/photo-1454496522488-7a8e488e8606',
  ),
];
