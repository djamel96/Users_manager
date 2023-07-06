import 'dart:convert';

class UserFromDb {
  final String firstName;
  final String lastName;
  final String title;
  final String gender;
  final String age;
  final DateTime dateOfBirth;
  final String streetNumber;
  final String streetName;
  final String city;
  final String country;
  final String picture;
  final String thumbnail;

  UserFromDb({
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.gender,
    required this.age,
    required this.dateOfBirth,
    required this.streetNumber,
    required this.streetName,
    required this.city,
    required this.country,
    required this.picture,
    required this.thumbnail,
  });

  factory UserFromDb.fromRawJson(String str) =>
      UserFromDb.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserFromDb.fromJson(Map<String, dynamic> json) => UserFromDb(
        firstName: json["firstName"],
        lastName: json["lastName"],
        title: json["title"],
        gender: json["gender"],
        age: json["age"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        streetNumber: json["streetNumber"],
        streetName: json["streetName"],
        city: json["city"],
        country: json["country"],
        picture: json["picture"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "title": title,
        "gender": gender,
        "age": age,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "streetNumber": streetNumber,
        "streetName": streetName,
        "city": city,
        "country": country,
        "picture": picture,
        "thumbnail": thumbnail,
      };
}
