import 'package:test/test.dart';
import '../lib/src/model/weather.dart';

void main() {
  group('Weather', () {
    test('returns correct Weather object', () {
      expect(
        Weather.fromJson(
            <String, dynamic>{'temperature': 15.3, 'weatherCode': .0}),
        isA<Weather>()
            .having((w) => w.temperature, 'temperature', 15.3)
            .having((w) => w.weatherCode, 'weatherCode',.0 ),
      );
    });
  });
}
