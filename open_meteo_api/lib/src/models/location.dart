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

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  final int id;
  final String name;
  final double latitude;
  final double longitude;

  @override
  String toString() {
    return '''Location(id: $id, name: $name, latitude: $latitude, longitude: $longitude)''';
  }
}
