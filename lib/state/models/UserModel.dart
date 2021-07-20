// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.followers,
    required this.following,
    required this.description,
    required this.profileImage,
    required this.token,
  });

  String id;
  String email;
  String userName;
  String firstName;
  String lastName;
  List<dynamic> followers;
  List<dynamic> following;
  String description;
  String profileImage;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        userName: json["user_name"] == null ? null : json["user_name"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        followers: json["followers"] == null
            ? []
            : List<dynamic>.from(json["followers"].map((x) => x)),
        following: json["following"] == null
            ? []
            : List<dynamic>.from(json["following"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "user_name": userName == null ? null : userName,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "followers": followers == null
            ? null
            : List<dynamic>.from(followers.map((x) => x)),
        "following": following == null
            ? null
            : List<dynamic>.from(following.map((x) => x)),
        "description": description == null ? null : description,
        "profile_image": profileImage == null ? null : profileImage,
        "token": token == null ? null : token,
      };
}
