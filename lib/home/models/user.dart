import 'dart:convert';
import 'package:charlie/home/models/user_location.dart';
import 'date_of_birth.dart';
import 'id.dart';
import 'login.dart';
import 'name.dart';
import 'picture.dart';

class User {
  final String gender;
  final Name name;
  final UserLocation location;
  final String email;
  final Login login;
  final DateOfBirth dob;
  final DateOfBirth registered;
  final String phone;
  final String cell;
  final Id id;
  final UserPicture picture;
  final String nat;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        location: UserLocation.fromJson(json["location"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        dob: DateOfBirth.fromJson(json["dob"]),
        registered: DateOfBirth.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: Id.fromJson(json["id"]),
        picture: UserPicture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "login": login.toJson(),
        "dob": dob.toJson(),
        "registered": registered.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id.toJson(),
        "picture": picture.toJson(),
        "nat": nat,
      };
}
