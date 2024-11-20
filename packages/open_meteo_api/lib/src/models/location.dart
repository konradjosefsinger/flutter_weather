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
    const requiredKeys = ['id', 'name', 'latitude', 'longitude'];
    for (var key in requiredKeys) {
      if(!json.containsKey(key)) {
        throw FormatException('Missing required key: $key');
      }
    }
    if (json['id'] == null ||
        json['name'] == null ||
        json['latitude'] == null ||
        json['longitude'] == null) {
          throw const FormatException('Null value(s) in JSON for required fields');
    }
    return _$LocationFromJson(json);
  }

  final int id;
  final String name;
  final double latitude;
  final double longitude;
}
