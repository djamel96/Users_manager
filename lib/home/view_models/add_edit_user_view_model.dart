import 'package:charlie/db/sqlite_helper.dart';
import 'package:charlie/helpers/custom_country_picker.dart';
import 'package:charlie/helpers/custom_date_picker.dart';
import 'package:charlie/helpers/email_validator.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:charlie/utils/constants.dart' as constant;

import 'package:flutter/material.dart';

class AddEditUserViewModel with ChangeNotifier {
  final dbHelper = SqliteHelper();
  List<String> titles = ["Mr", "Mrs", "Miss", "Ms", "Dr", "Prof"];
  init(GlobalKey<FormState> widgetFormKey) {
    formKey = widgetFormKey;
    loading = false;
    firstNameController.clear();
    birthDateController.clear();
    lastNameController.clear();
    streetNumberController.clear();
    cityNameController.clear();
    countryNameController.clear();
    emailController.clear();
    pictureLinkController.clear();
    streetNameController.clear();
    birthDate = null;
    now = DateTime.now();
    gender = null;
    title = null;
    notifyListeners();
  }

  initEditUser(GlobalKey<FormState> widgetFormKey, UserViewModel userVM) {
    formKey = widgetFormKey;
    loading = false;
    firstNameController.text = userVM.firstName;
    lastNameController.text = userVM.lastName;
    emailController.text = userVM.email;
    birthDateController.text =
        CustomDateTimePicker.getDateWithDayAndYear(userVM.dateOfBirth);
    streetNumberController.text = userVM.streetNumber;
    streetNameController.text = userVM.streetName;
    cityNameController.text = userVM.city;
    countryNameController.text = userVM.country;
    pictureLinkController.text = userVM.picture;
    birthDate = userVM.dateOfBirth;
    now = DateTime.now();
    gender = userVM.gender;
    title = userVM.title;
    if (!titles.contains(userVM.title)) {
      titles.add(userVM.title);
    }
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
  String? title;
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

  selectTitle(String value) {
    title = value;
    notifyListeners();
  }

  bool get firstNameIsValid {
    return firstNameController.text.isNotEmpty;
  }

  bool get lastNameIsValid {
    return lastNameController.text.isNotEmpty;
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
    return EmailValidator.isEmailValid(emailController.text);
  }

  bool get countryNameIsValid {
    return countryNameController.text.isNotEmpty;
  }

  bool get pictureLinkIsValid {
    return pictureLinkController.text.isNotEmpty;
  }

  bool get titleIsValid {
    return title != null;
  }

  bool get genderIsValid {
    return gender != null;
  }

  bool get isMale {
    return gender == constant.male;
  }

  bool get isFemale {
    return gender == constant.female;
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
          title: title!,
          gender: gender!,
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

        dbHelper.insertUser(userVM);
        setLoading(false);
        completion(true, userVM);
      }
    } catch (e) {
      setLoading(false);
      completion(false, null);
    }
  }

  updateUser(UserViewModel userToEdit,
      void Function(bool, UserViewModel?) completion) async {
    try {
      final form = formKey.currentState;

      if (form!.validate()) {
        setLoading(true);
        form.save();
        UserViewModel userVM = UserViewModel(
          id: userToEdit.id,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          title: title!,
          gender: gender!,
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
        await dbHelper.updateUser(userVM);
        userToEdit = userVM;
        notifyListeners();
        setLoading(false);
        completion(true, userVM);
      }
    } catch (e) {
      setLoading(false);
      completion(false, null);
    }
  }
}
