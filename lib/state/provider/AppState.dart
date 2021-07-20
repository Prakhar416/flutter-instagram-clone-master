// @dart=2.9

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:insta_clone/state/models/UserModel.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/state/services/AuthServices.dart';

class AppState extends ChangeNotifier {
  String token = "";
  bool isAuthentificated = false;
  bool isLoading = false;
  var user;
  String error = "";
  PageController controller = PageController(initialPage: 1);

  AppState(
      {this.token = "",
      this.isAuthentificated = false,
      this.isLoading = false,
      this.user = UserModel});

  final storage = FlutterSecureStorage();

  void changePage(int val) {
    print('changed');
    controller.animateToPage(
      val,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    notifyListeners();
  }

  Future<void> fetchUser() async {
    print("Start Fetching User");
    // setLoading(true);

    final storage = FlutterSecureStorage();

    final token = await storage.read(key: "token");
    if (token == null) {
      print("No user to fetch");
      return;
    }

    await Auth().fetchUser(token).then((response) async {
      if (response.statusCode == 200) {
        UserModel data = UserModel.fromJson(json.decode(response.body));
        setLoading(false);
        setUser(data);
        setAuthentificated(true);

        print(user.id);

        if (isAuthentificated) {
          await PostState().getFriendsPosts(user.id);
        }
      }
    }).catchError((response) async {
      setLoading(false);
      setUser(null);
      setAuthentificated(false);

      await storage.deleteAll();

      onError(response.body);
    });
  }

  Future<void> login(data) async {
    print("Start Login User");
    setLoading(true);

    try {
      var response = await Auth().login(data);

      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        UserModel data = UserModel.fromJson(json.decode(response.body));
        String token = userMap['token'].toString();

        storage.write(key: "token", value: token);
        storage.write(key: "user", value: jsonEncode(userMap));

        setLoading(false);
        setUser(data);
        setAuthentificated(true);

        if (isAuthentificated) {
          await PostState().getFriendsPosts(user.id);
        }
      }
    } on TimeoutException {
      setLoading(false);
      http.Client().close();
      print(
          "Login TimeoutException: There Was A Problem Connecting To The Server");
      return null;
    } on SocketException {
      http.Client().close();
      setLoading(false);
      print(
          "Login SocketException: There Was A Problem Connecting To The Server");
      return null;
    } catch (error) {
      setLoading(false);
      print(error);
      return null;
    }

    // await Auth().login(data).then((response) async {
    //   print(response);
    //   if (response.statusCode == 200) {
    //     Map<String, dynamic> userMap = jsonDecode(response.body);
    //     UserModel data = UserModel.fromJson(json.decode(response.body));
    //     String token = userMap['token'].toString();

    //     storage.write(key: "token", value: token);
    //     storage.write(key: "user", value: jsonEncode(userMap));

    //     setLoading(false);
    //     setUser(data);
    //     setAuthentificated(true);

    //     if (isAuthentificated) {
    //       await PostState().getFriendsPosts(user.id);
    //     }
    //   } else {
    //     onError(response.body);
    //   }
    // }).catchError((response) async {
    //   onError(response.body);
    // }).onError((error, stackTrace) {
    //   print(error);
    //   print(stackTrace);
    // }).timeout(
    //     Duration(
    //       seconds: 10,
    //     ), onTimeout: () {
    //        setLoading(false);
    //   throw SocketException("There Was A Problem Connecting To The Server");
    // });
  }

  Future<void> register(data) async {
    setLoading(true);

    Auth().register(data).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        UserModel data = UserModel.fromJson(json.decode(response.body));
        String token = userMap['token'].toString();

        storage.write(key: "token", value: token);
        storage.write(key: "user", value: jsonEncode(userMap));

        setLoading(false);
        setUser(data);
        setAuthentificated(true);
      } else {
        onError(response.body);
      }
    }).catchError((response) async {
      onError(response.body);
    }).timeout(
        Duration(
          seconds: 10,
        ), onTimeout: () {
      print("There Was A Problem Connecting To The Server");
      return null;
    });
  }

  void logout() async {
    setLoading(false);
    setUser(null);
    setAuthentificated(false);
    setError("");

    PostState().clearFeedPosts();
    PostState().clearExplorePosts();
    PostState().clearOwnPosts();

    await storage.deleteAll();
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setAuthentificated(bool value) {
    isAuthentificated = value;
    notifyListeners();
  }

  void setUser(UserModel value) {
    user = value;
    notifyListeners();
  }

  void setError(value) {
    error = value.toString();
    notifyListeners();
  }

  void onError(value) async {
    print(value);
    setLoading(false);
    setUser(null);
    setAuthentificated(false);
    setError(value);

    await storage.deleteAll();
  }

  getUser() => user;
}
