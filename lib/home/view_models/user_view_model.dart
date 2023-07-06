import 'package:charlie/home/models/user.dart';

class UserVM {
  String firstName;
  String lastName;
  String title;
  String gender;
  String age;
  DateTime dateOfBirth;
  String streetNumber;
  String streetName;
  String city;
  String country;
  String picture;
  String thumbnail;

  UserVM({
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

  factory UserVM.fromUserModel(User user) {
    return UserVM(
      firstName: user.name.first,
      lastName: user.name.last,
      title: user.name.title,
      dateOfBirth: user.dob.date,
      streetNumber: user.location.street.number,
      streetName: user.location.street.name,
      city: user.location.city,
      country: user.location.country,
      age: user.dob.age.toString(),
      gender: user.gender,
      picture: user.picture.large,
      thumbnail: user.picture.medium,
    );
  }

  String get fullAddress {
    return '$streetNumber $streetName, $city, $country ';
  }

  String get fullName {
    return '$title. $lastName $firstName';
  }

  bool get isMale {
    return gender == 'male';
  }
}
