import 'dart:convert';

class UserFromDb {
  int id;
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
  final int favorite;
  final String email;

  UserFromDb({
    required this.id,
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
    required this.favorite,
    required this.email,
  });

  factory UserFromDb.fromRawJson(String str) =>
      UserFromDb.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory UserFromDb.fromMap(Map<String, dynamic> json) => UserFromDb(
        id: json['id'],
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
        favorite: json["favorite"],
        email: json['email'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
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
        "email": email,
        "favorite": favorite,
      };
}
