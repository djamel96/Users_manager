import 'dart:convert';

class UserCoordinates {
  final String latitude;
  final String longitude;

  UserCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory UserCoordinates.fromRawJson(String str) =>
      UserCoordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserCoordinates.fromJson(Map<String, dynamic> json) =>
      UserCoordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
