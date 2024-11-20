/*
{
  "current_weather": {
    "temperature": 15.3,
    "weathercode": 63
  }
}
*/

import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  const Weather({required this.temperature, required this.weatherCode});

  factory Weather.fromJson(Map<String, dynamic> json) {
    const requiredKeys = ['temperature', 'weathercode'];
    for (var key in requiredKeys) {
      if (!json.containsKey(key)) {
        throw FormatException('Missing required key: $key');
      }
    }
    if (json['temperature'] == null || json['weathercode'] == null) {
      throw const FormatException('Null value(s) in JSON for required fields');
    }
    if (json['temperature'] is! num || json['weathercode'] is! num) {
      throw const FormatException(
          'Invalid type(s) in JSON for required fields');
    }
    return _$WeatherFromJson(json);
  }

  final double temperature;
  @JsonKey(name: "weathercode")
  final double weatherCode;
}
