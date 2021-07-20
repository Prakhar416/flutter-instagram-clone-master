// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.id,
    required this.userId,
    required this.postId,
    required this.comment,
    required this.replies,
    required this.createdAt,
  });

  String email;
  String firstName;
  String lastName;
  String userName;
  String id;
  String userId;
  String postId;
  String comment;
  var replies;
  var createdAt;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        userName: json["user_name"] == null ? null : json["user_name"],
        id: json["_id"] == null ? null : json["_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        postId: json["post_id"] == null ? null : json["post_id"],
        comment: json["comment"] == null ? null : json["comment"],
        replies: json["replies"] == null
            ? null
            : List<dynamic>.from(json["replies"].map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "user_name": userName == null ? null : userName,
        "_id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "post_id": postId == null ? null : postId,
        "comment": comment == null ? null : comment,
        "replies":
            replies == null ? null : List<dynamic>.from(replies.map((x) => x)),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
