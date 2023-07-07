class EmailValidator {
  static bool isEmailValid(String? email) {
    if (email?.isEmpty ?? true) return false;
    // Regular expression pattern for email validation
    final RegExp regex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );

    // Check if the email matches the pattern
    return regex.hasMatch(email!);
  }
}
