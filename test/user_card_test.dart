import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:charlie/home/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('UserCard Widget Test', (WidgetTester tester) async {
    // Create a mock UserViewModel object
    final userVM = UserViewModel(
      firstName: 'John',
      lastName: 'Doe',
      title: 'Mr',
      gender: 'male',
      age: '30',
      dateOfBirth: DateTime(1992, 1, 1),
      streetNumber: '123',
      streetName: 'Main Street',
      city: 'New York',
      country: 'USA',
      picture: 'https://example.com/profile.png',
      thumbnail: 'https://example.com/profile_thumb.png',
      favorite: 0,
      email: 'john.doe@example.com',
    );

    // Build the UserCard widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: UserCard(
            userVM: userVM,
            onDelete: () {},
            onFavorite: () {},
          ),
        ),
      ),
    );

    // Verify if the UserCard is rendered correctly
    expect(find.text('Mr. Doe John'), findsOneWidget);
    expect(find.text('123 Main Street, New York, USA'), findsOneWidget);
  });
}
