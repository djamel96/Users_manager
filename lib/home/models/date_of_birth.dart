import 'dart:convert';

class DateOfBirth {
  final DateTime date;
  final int age;

  DateOfBirth({
    required this.date,
    required this.age,
  });

  factory DateOfBirth.fromRawJson(String str) =>
      DateOfBirth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DateOfBirth.fromJson(Map<String, dynamic> json) => DateOfBirth(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
      };
}
