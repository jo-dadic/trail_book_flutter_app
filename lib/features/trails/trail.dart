enum TrailDifficulty {
  easy,
  moderate,
  hard,
}

class Trail {
  const Trail({
    required this.id,
    required this.name,
    required this.location,
    required this.distanceKm,
    required this.durationMinutes,
    required this.elevationGainMeters,
    required this.difficulty,
    this.description = '',
    this.imageUrl,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String location;
  final double distanceKm;
  final int durationMinutes;
  final int elevationGainMeters;
  final TrailDifficulty difficulty;
  final String description;
  final String? imageUrl;
  final bool isFavorite;

  // podaci su došli izvana, u JSON obliku, a mi ih pretvaramo u Trail objekt, da ih app može koristiti
  factory Trail.fromJson(Map<String, dynamic> json) {
    return Trail(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      distanceKm: (json['distanceKm'] as num).toDouble(),
      durationMinutes: json['durationMinutes'] as int,
      elevationGainMeters: json['elevationGainMeters'] as int,
      difficulty: TrailDifficulty.values.byName(json['difficulty'] as String),
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  // kada šaljemo na endpoint, pretvaramo Trail objekt u JSON oblik, da ga server može razumjeti
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'distanceKm': distanceKm,
      'durationMinutes': durationMinutes,
      'elevationGainMeters': elevationGainMeters,
      'difficulty': difficulty.name,
      'description': description,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
