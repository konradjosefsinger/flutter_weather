import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:test/test.dart';

// Test if Location.fromJson correctly parses the input JSON and creates a Location object with the expected properties

// The main() function contains all the tests
void main () {
  // Grouping test related to the Location class
  group('Location', () {
    // Nesting groups indicates that this set of tests specifically focuses on the fromJson method of the Location class
    group('fromJson', () {
      // Define an individual test with a descriptive name
      test('returns correct Location object', () {
        // expect is the primary assertion function in the test framework. It checks if the actual result matches the expected result
        expect(
          // Location.fromJson converts a JSON map into a Location instance (-> This is what the test aims to validate)
          Location.fromJson(
            <String, dynamic> {
              'id': 4887398,
              'name': 'Chicago',
              'latitude': 41.85003,
              'longitude': -87.65005,
            },
          ),
          // isA<Location>() asserts that the result is an instance of the Location class. (-> This ensures that the fromJson method returns the correct type)
          isA<Location>()
            .having((w) => w.id, 'id', 4887398)
            .having((w) => w.name, 'name', 'Chicago')
            .having((w) => w.latitude, 'latitude', 41.85003)
            .having((w) => w.longitude, 'longitude', -87.65005),
        );
      });
    });
  });
}