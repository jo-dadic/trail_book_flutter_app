import 'package:flutter_test/flutter_test.dart';
import 'package:trail_book_flutter_app/features/trails/trail.dart';

void main() {
  test('creates a trail from json', () {
    final trail = Trail.fromJson({
      'id': 'sljeme-loop',
      'name': 'Sljeme Loop',
      'location': 'Medvednica, Croatia',
      'distanceKm': 12.5,
      'difficulty': 'moderate',
    });

    expect(trail.name, 'Sljeme Loop');
    expect(trail.location, 'Medvednica, Croatia');
    expect(trail.distanceKm, 12.5);
    expect(trail.description, '');
    expect(trail.isFavorite, false);
  });
}
