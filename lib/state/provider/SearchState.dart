import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:insta_clone/state/models/UserModel.dart';
import 'package:insta_clone/state/services/SearchServices.dart';

class SearchState extends ChangeNotifier {
  bool loadingUsers = false;
  List users = [];

  Future<void> followUser(id, userId) async {
    await SearchServices().followUser(id, userId).then((response) {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          return;
        }

        print(response.body);
      } else {
        print(response.body);
        return;
      }
    }).catchError((error) {
      print(error);
    });
    //

    notifyListeners();

    //
  }

  Future<void> searchUser(search) async {
    print('Start Searching Users');
    setIsLoadingUsers(true);

    await SearchServices().searchUser(search).then((response) {
      var responseList = jsonDecode(response.body) as List;
      List<UserModel> userModel =
          responseList.map((e) => UserModel.fromJson(e)).toList();

      print(userModel.length);
      setUsers(userModel);
      setIsLoadingUsers(false);
    }).catchError((err) {
      print(err);
      setIsLoadingUsers(false);
      clearUsers();
    });
  }

  void setUsers(value) {
    users = value;
    notifyListeners();
  }

  void clearUsers() {
    users = [];
    notifyListeners();
  }

  void setIsLoadingUsers(value) {
    loadingUsers = value;
    notifyListeners();
  }
}
