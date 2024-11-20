import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:test/test.dart';

void main() {
  group('Weather', () {
    group('fromJson', () {
      test('returns correct Weather object', () {
        expect(
          Weather.fromJson(
            <String, dynamic>{'temperature': 15.3, 'weathercode': 63},
          ),
          isA<Weather>()
              .having((w) => w.temperature, 'temperature', 15.3)
              .having((w) => w.weatherCode, 'weatherCode', 63),
        );
      });
      test('throws error when JSON is missing required keys', () {
        expect(
          () => Weather.fromJson(<String, dynamic>{'temperature': 15.3}),
          throwsA(isA<FormatException>()),
        );
      });
      test('throws error when JSON has invalid types', () {
        expect(
          () => Weather.fromJson(<String, dynamic>{
            'temperature': 'invalid_value',
            'weathercode': 'invalid_value',
          }),
          throwsA(isA<FormatException>()),
        );
      });
    });
  });
}
