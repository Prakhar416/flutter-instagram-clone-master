// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.profileImage,
    required this.likes,
    required this.comments,
    required this.id,
    required this.userId,
    required this.postImageUrl,
    required this.description,
    required this.createdAt,
  });

  String email;
  String firstName;
  String lastName;
  String userName;
  String profileImage;

  List<dynamic> likes;
  List<dynamic> comments;
  String id;
  String userId;
  String postImageUrl;
  String description;
  var createdAt;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        userName: json["user_name"] == null ? null : json["user_name"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        likes: json["likes"] == null
            ? []
            : List<dynamic>.from(json["likes"].map((x) => x)),
        comments: json["comments"] == null
            ? []
            : List<dynamic>.from(json["comments"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        postImageUrl:
            json["post_image_url"] == null ? null : json["post_image_url"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "user_name": userName == null ? null : userName,
        "profile_image": profileImage == null ? null : profileImage,
        "likes": likes == null ? null : List<dynamic>.from(likes.map((x) => x)),
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments.map((x) => x)),
        "_id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "post_image_url": postImageUrl == null ? null : postImageUrl,
        "description": description == null ? null : description,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
