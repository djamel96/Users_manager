import 'dart:developer';

import 'package:charlie/db/sqlite_helper.dart';
import 'package:charlie/helpers/custom_country_picker.dart';
import 'package:charlie/helpers/custom_date_picker.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:charlie/utils/constants.dart' as constant;

import 'package:flutter/material.dart';

class AddEditUserViewModel with ChangeNotifier {
  final dbHelper = SqliteHelper();

  init(GlobalKey<FormState> widgetFormKey) {
    formKey = widgetFormKey;
    loading = false;
    firstNameController.clear();
    birthDateController.clear();
    lastNameController.clear();
    streetNumberController.clear();
    cityNameController.clear();
    countryNameController.clear();
    pictureLinkController.clear();
    birthDate = null;
    now = DateTime.now();
    gender = null;
    notifyListeners();
  }

  late GlobalKey<FormState> formKey;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDateController = TextEditingController();
  final streetNumberController = TextEditingController();
  final streetNameController = TextEditingController();
  final cityNameController = TextEditingController();
  final countryNameController = TextEditingController();
  final pictureLinkController = TextEditingController();
  String? gender;
  DateTime? birthDate;
  DateTime now = DateTime.now();
  bool loading = false;

  setLoading(bool val) {
    loading = val;
    notifyListeners();
  }

  selectDate(BuildContext context) {
    CustomDateTimePicker.selectDatePop(
      context,
      begin: now.add(const Duration(days: -365 * 70)),
      initialDate: birthDate ?? now.add(const Duration(days: -365 * 20)),
      last: now,
    ).then((value) {
      if (value != null) {
        birthDate = value;
        birthDateController.text =
            CustomDateTimePicker.getDateWithDayAndYear(value);
      }
    });
  }

  selectCountry(BuildContext context) {
    CustomCountryPicker.pickCountry(context, (country) {
      countryNameController.text = country.name;
      notifyListeners();
    });
  }

  setGender(String value) {
    gender = value;
    notifyListeners();
  }

  bool get firstNameIsValid {
    return firstNameController.text.isNotEmpty;
  }

  bool get lastNameIsValid {
    return firstNameController.text.isNotEmpty;
  }

  bool get birthDateIsValid {
    return birthDateController.text.isNotEmpty && birthDate != null;
  }

  bool get streetNumberIsValid {
    return streetNumberController.text.isNotEmpty;
  }

  bool get streetNameIsValid {
    return streetNameController.text.isNotEmpty;
  }

  bool get cityNameIsValid {
    return cityNameController.text.isNotEmpty;
  }

  bool get emailIsValid {
    return emailController.text.isNotEmpty;
  }

  bool get countryNameIsValid {
    return countryNameController.text.isNotEmpty;
  }

  bool get pictureLinkIsValid {
    return pictureLinkController.text.isNotEmpty;
  }

  bool get isMale {
    return gender == constant.male;
  }

  bool get isFemale {
    return gender == constant.female;
  }

  updateUser(void Function(bool) completion) async {
    if (loading) return;
    final form = formKey.currentState;

    if (form!.validate()) {
      setLoading(true);
      form.save();

      setLoading(false);
      completion(true);
    }
  }

  int get age {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate!.year;

    if (currentDate.month < birthDate!.month ||
        (currentDate.month == birthDate!.month &&
            currentDate.day < birthDate!.day)) {
      age--;
    }
    return age;
  }

  saveUser(void Function(bool, UserViewModel?) completion) async {
    try {
      final form = formKey.currentState;

      if (form!.validate()) {
        setLoading(true);
        form.save();
        UserViewModel userVM = UserViewModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          title: 'title',
          gender: 'male',
          age: age.toString(),
          dateOfBirth: birthDate!,
          streetNumber: streetNumberController.text,
          streetName: streetNameController.text,
          city: cityNameController.text,
          country: countryNameController.text,
          picture: pictureLinkController.text,
          thumbnail: pictureLinkController.text,
          email: emailController.text,
        );

        log(userVM.toMap().toString());
        dbHelper.insertUser(userVM);
        setLoading(false);
        completion(true, userVM);
      }
    } catch (e) {
      setLoading(false);
      completion(false, null);
    }
  }

  Map<String, dynamic> buildRequestBody() {
    return {
      "type": firstNameController.text,
    };
  }
}
