import 'dart:convert';

class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;

  UserPicture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory UserPicture.fromRawJson(String str) =>
      UserPicture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserPicture.fromJson(Map<String, dynamic> json) => UserPicture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
