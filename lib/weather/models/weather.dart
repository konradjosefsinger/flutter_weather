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

// An enum is a special type used to define a collection of named, constant values
// Enums are useful when one has a fixed set of related options or states, e.g. such as the days of the week
// Using enums makes code more readable and less error-prone by replacing arbitrary strings or integers with meaningful names
enum TemperatureUnits { fahrenheit, celsius }

// The extension keyword in Dart is used to add functionality to existing types, such as classes, enums or even built-in types without modifying their original implementation
// The extension keyword allows to "extend" a type by adding new methods, getters, or other members
// Here a getter is added to the TemperatureUnits type. This is an additional property for any instance of TemperatureUnits
// The getter uses "this" to refer to the current instance of TemperatureUnits. It checks whether the current instance equals TemperatureUnits.fahrenheit or TemperatureUnits.celsius
extension TemperatureUnitsX on TemperatureUnits {
  // Getters are special methods that allow to retrieve the value of a property.
  // They are used to access data in an object without directly exposing the underlying fields
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

// The @JsonSerializable() annotation is used with the json_serializable package to generate serialization code for converting objects to and from JSON
// This annotation simplifies working with JSON data by automatiing the creation of boilerplat serialization and deserialization methods
@JsonSerializable()
class Temperature extends Equatable {
  const Temperature({required this.value});

  // A factory is a special type of constructor used to control how instances of a class are created
  // It allows to return an existing instacne, create a new one, or even return an instance of a different subtype
  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  final double value;

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  @override
  List<Object> get props => [value];
}

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.condition,
    required this.lastUpdated,
    required this.location,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      condition: weather.condition,
      lastUpdated: DateTime.now(),
      location: weather.location,
      temperature: Temperature(value: weather.temperature),
    );
  }

  static final empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: DateTime(0),
    temperature: const Temperature(value: 0),
    location: '--',
  );

  final WeatherCondition condition;
  final DateTime lastUpdated;
  final String location;
  final Temperature temperature;

  @override
  List<Object> get props => [condition, lastUpdated, location, temperature];

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  Weather copyWith({
    WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    Temperature? temperature,
  }) {
    return Weather(
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
    );
  }
}
