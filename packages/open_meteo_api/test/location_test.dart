import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:test/test.dart';

// Test if Location.fromJson correctly parses the input JSON and creates a Location object with the expected properties
// The test operates directly on the Location class and its fromJson method

// The main() function contains all the tests
void main () {
  // Grouping test related to the Location class
  group('Location', () {
    // Nesting groups indicates that this set of tests specifically focuses on the fromJson method of the Location class
    group('fromJson', () {

      // Define an individual test with a descriptive name
      test('returns correct Location object', () {
        // expect is the primary assertion function in the test framework. It checks if the actual result matches the expected result
        // Basic Syntax: expect(actual, matcher)
        // -> actual is the value being tested, which is the result from calling Location.fromJson
        // -> matcher is a condition that the actual value must satisfy
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
          // In this test the matcher is a chain of isA<Location>() combined with .having clauses to ensure the object has the correct type and properties
          // isA<T>() is a matcher provided by the test package to assert that a value is an instance of a specific type. The isA<T>() matcher checks the runtime type of the object using Dart's type system
          isA<Location>()
            // .having(...) adds additional assertions on the properties of the Locatin object
            // The .having method is part of the isA matcher and allows to perform deeper assertions on properties of an object
            // Basic Syntax: .having((object) => property, 'description', expectedValue)
            // One can chain ,ultiple .having calls to test multiple properties of the same object. Each .having adds a new assertion
            .having((w) => w.id, 'id', 4887398)
            .having((w) => w.name, 'name', 'Chicago')
            .having((w) => w.latitude, 'latitude', 41.85003)
            .having((w) => w.longitude, 'longitude', -87.65005),
        );
      });

      test('throws error when JSON is missing required keys', () {
        expect(
          () => Location.fromJson(<String, dynamic> {'id': 4887398}),
          throwsA(isA<TypeError>()),
        );
      });

      test('throws error when JSON has null values', () {
        expect(
          () => Location.fromJson(<String, dynamic> {
            'id': null,
            'name': null,
            'latitude': null,
            'longitude': null,
          }),
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}