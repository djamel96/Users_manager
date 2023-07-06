import 'dart:convert';
import 'coordinates.dart';
import 'street.dart';
import 'timezone.dart';

class UserLocation {
  final Street street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final UserCoordinates coordinates;
  final Timezone timezone;

  UserLocation({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromRawJson(String str) =>
      UserLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        street: Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"].toString(),
        coordinates: UserCoordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
      };
}
