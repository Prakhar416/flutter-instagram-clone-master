import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:insta_clone/state/models/CommentModel.dart';
import 'package:insta_clone/state/services/CommentServices.dart';

class CommentState extends ChangeNotifier {
  bool loadingComments = false;
  late List<CommentModel> comments;

  Future<void> getComments(postId) async {
    setLoadingComments(true);
    await CommentServices().getComments(postId).then((response) {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          setLoadingComments(false);
          clearComment();
          return;
        }

        var responseList = jsonDecode(response.body) as List;
        List<CommentModel> commentModel =
            responseList.map((e) => CommentModel.fromJson(e)).toList();

        setComments(commentModel);
        print(comments.length);
        setLoadingComments(false);
      } else {
        setLoadingComments(false);
        print(response.body);
        return;
      }
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> postComment(id, postId, comment) async {
    setLoadingComments(true);
    await CommentServices().postComment(id, postId, comment).then((response) {
      CommentModel newComment =
          CommentModel.fromJson(jsonDecode(response.body));

      comments.insert(0, newComment);
      setLoadingComments(false);
    }).catchError((error) {
      print(error);
    });
  }

  void setComments(value) {
    comments = value;
    notifyListeners();
  }

  void clearComment() {
    comments = [];
    notifyListeners();
  }

  void setLoadingComments(value) {
    loadingComments = value;
    notifyListeners();
  }
}
