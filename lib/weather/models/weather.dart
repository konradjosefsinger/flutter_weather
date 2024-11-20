import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

// The hide keyword in Dart is used in import statements to exclude specific classes, functions, or other member from the imported library
// This allows to prevent name clashes or exclude members one don't want to use from a library
// "show" is the opposite of hide. It is used to explicitly import only specific members from a library
// By using hide and show, one can control the scope of the imports and avoid conflicts or unnecessary imports
import 'package:weather_repository/weather_repository.dart' hide Weather;

// In Dart, the part keyword is used to split a single Dart library into multiple files. This helps organize code across multiple files while keeping it part of the same library
part 'weather.g.dart';

enum TemperatureUnits { fahrenheit, celsius }

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
}

