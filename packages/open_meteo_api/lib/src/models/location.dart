/*
{
  "results": [
    {
      "id": 4887398,
      "name": "Chicago",
      "latitude": 41.85003,
      "longitude": -87.65005
    }
  ]
}
*/

// @JsonSerializable: label classes which can be serialized
// @JsonKey: provide string representation of field names
// @JsonValue: provide string representations of field values
// JSONConverter: convert object representations into JSON representation

import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  const Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id') ||
        !json.containsKey('name') ||
        !json.containsKey('latitude') ||
        !json.containsKey('longitude')) {
      throw FormatException('Missing required key(s) in JSON');
    }
    if (json['id'])
  }
  _$LocationFromJson(json);

  final int id;
  final String name;
  final double latitude;
  final double longitude;
}
