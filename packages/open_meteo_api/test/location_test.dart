import 'package:test/test.dart';
import '../lib/src/model/location.dart';

void main() {
  group('Location', () {
    test('returns correct Location object', () {
      expect(
        Location.fromJson(
          <String, dynamic>{
            'id': 4887398,
            'name': 'Chicago',
            'latitude': 41.85003,
            'longitude': -87.65005,
          },
        ),
        isA<Location>()
            .having((w) => w.id, 'id', 4887398)
            .having((w) => w.name, 'name', 'Chicago')
            .having((w) => w.latitude, 'latitude', 41.85003)
            .having((w) => w.longitude, 'longitude', -87.65005),
      );
    });
  });
}
