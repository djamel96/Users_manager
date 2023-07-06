import 'package:charlie/home/models/user.dart';
import 'package:charlie/home/models/user_from_db.dart';

class UserViewModel {
  int? id;
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
  int favorite;

  UserViewModel({
    this.id,
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
    this.favorite = 0,
  });

  factory UserViewModel.fromUserModel(User user) {
    return UserViewModel(
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

  factory UserViewModel.fromUserFromDBModel(UserFromDb user) {
    return UserViewModel(
      firstName: user.firstName,
      lastName: user.lastName,
      title: user.title,
      dateOfBirth: user.dateOfBirth,
      streetNumber: user.streetNumber,
      streetName: user.streetName,
      city: user.city,
      country: user.country,
      age: user.age,
      gender: user.gender,
      picture: user.picture,
      thumbnail: user.picture,
      favorite: user.favorite,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'title': title,
        'gender': gender,
        'age': age,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'streetNumber': streetNumber,
        'streetName': streetName,
        'city': city,
        'country': country,
        'picture': picture,
        'thumbnail': thumbnail,
        'favorite': favorite,
      };

  String get fullAddress {
    return '$streetNumber $streetName, $city, $country ';
  }

  String get fullName {
    return '$title. $lastName $firstName';
  }

  bool get isMale {
    return gender == 'male';
  }

  setFavorite(int val) {
    favorite = val;
  }
}
