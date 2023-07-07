import 'package:charlie/home/view_models/add_edit_user_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Test the form fields validations
  group("AddEditUserViewModel", () {
    late AddEditUserViewModel viewModel;

    setUp(() => viewModel = AddEditUserViewModel());

    group("firstNameIsValid", () {
      test("returns true when first name is not empty", () {
        viewModel.firstNameController.text = "name";
        expect(viewModel.firstNameIsValid, true);
      });

      test('returns false when name is empty', () {
        viewModel.firstNameController.text = '';
        expect(viewModel.firstNameIsValid, false);
      });
    });

    group("lastNameIsValid", () {
      test("returns true when last name is not empty", () {
        viewModel.lastNameController.text = "name";
        expect(viewModel.lastNameIsValid, true);
      });

      test('returns false when last name is empty', () {
        viewModel.lastNameController.text = '';
        expect(viewModel.lastNameIsValid, false);
      });
    });

    group("titleIsValid", () {
      test("returns true when title is selected", () {
        viewModel.title = "title";
        expect(viewModel.titleIsValid, true);
      });

      test('returns false when title is not selected', () {
        viewModel.title = null;
        expect(viewModel.titleIsValid, false);
      });
    });

    group("genderIsValid", () {
      test("returns true when gender is selected", () {
        viewModel.gender = "male";
        expect(viewModel.genderIsValid, true);
      });

      test('returns false when gender is not selected', () {
        viewModel.gender = null;
        expect(viewModel.genderIsValid, false);
      });
    });

    group('emailIsValid', () {
      test('returns true when email is valid', () {
        viewModel.emailController.text = 'valid@email.com';
        expect(viewModel.emailIsValid, true);
      });

      test('returns false when email is not valid', () {
        viewModel.emailController.text = 'email@';
        expect(viewModel.emailIsValid, false);
      });
    });

    group("birthDateIsValid", () {
      test("returns true when birthday is selected", () {
        viewModel.birthDateController.text = DateTime.now().toIso8601String();
        viewModel.birthDate = DateTime.now();
        expect(viewModel.birthDateIsValid, true);
      });

      test('returns false when birthDay is not selected', () {
        viewModel.birthDateController.text = '';
        expect(viewModel.birthDateIsValid, false);
      });
    });

    group("streetNumberIsValid", () {
      test("returns true when street number is not empty", () {
        viewModel.streetNumberController.text = "32";
        expect(viewModel.streetNumberIsValid, true);
      });

      test('returns false when street number is empty', () {
        viewModel.streetNumberController.text = '';
        expect(viewModel.streetNumberIsValid, false);
      });
    });

    group("streetNumberIsValid", () {
      test("returns true when street number is not empty", () {
        viewModel.streetNumberController.text = "32";
        expect(viewModel.streetNumberIsValid, true);
      });

      test('returns false when street number is empty', () {
        viewModel.streetNumberController.text = '';
        expect(viewModel.streetNumberIsValid, false);
      });
    });

    group("streetNameIsValid", () {
      test("returns true when street name is not empty", () {
        viewModel.streetNameController.text = "Paris";
        expect(viewModel.streetNameIsValid, true);
      });

      test('returns false when street name is empty', () {
        viewModel.streetNameController.text = '';
        expect(viewModel.streetNameIsValid, false);
      });
    });

    group("cityNameIsValid", () {
      test("returns true when city name is not empty", () {
        viewModel.cityNameController.text = "32";
        expect(viewModel.cityNameIsValid, true);
      });

      test('returns false when city name is empty', () {
        viewModel.cityNameController.text = '';
        expect(viewModel.cityNameIsValid, false);
      });
    });

    group("countryNameIsValid", () {
      test("returns true when country name is not empty", () {
        viewModel.countryNameController.text = "France";
        expect(viewModel.countryNameIsValid, true);
      });

      test('returns false when country name is empty', () {
        viewModel.countryNameController.text = '';
        expect(viewModel.countryNameIsValid, false);
      });
    });
  });
}
