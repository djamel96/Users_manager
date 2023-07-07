import 'package:charlie/helpers/custom_country_picker.dart';
import 'package:charlie/helpers/custom_date_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AddEditUserViewModel with ChangeNotifier {
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
    date = null;
    now = DateTime.now();
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

  DateTime? date;
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
      initialDate: date ?? now.add(const Duration(days: -365 * 20)),
      last: now,
    ).then((value) {
      if (value != null) {
        date = value;
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

  bool get firstNameIsValid {
    return firstNameController.text.isNotEmpty;
  }

  bool get birthDateIsValid {
    return birthDateController.text.isNotEmpty && date != null;
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

  saveUser(void Function(bool) completion) async {
    if (loading) return;
    final form = formKey.currentState;

    if (form!.validate()) {
      setLoading(true);
      form.save();

      setLoading(false);
      completion(true);
    }
  }

  Map<String, dynamic> buildRequestBody() {
    return {
      "type": firstNameController.text,
    };
  }
}
