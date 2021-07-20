import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PostServices {
  final storage = FlutterSecureStorage();

  Future<http.Response> getFriendsPosts(String id) async {
    // print(id);

    final url = Uri.parse("http://10.0.2.2:5000/post/friends/$id");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    return http.get(url, headers: headers);
  }

  Future<http.Response> getAllPosts() async {
    final url = Uri.parse("http://10.0.2.2:5000/post/all");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    return http.post(url, headers: headers);
  }

  Future<http.Response> getOwnPosts(id) async {
    final url = Uri.parse("http://10.0.2.2:5000/post/own/$id");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    return http.post(url, headers: headers);
  }

  Future<http.Response> getSinglePost(id) async {
    final url = Uri.parse("http://10.0.2.2:5000/post/$id");
    final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      "auth-token": "$token"
    };

    return http.get(url, headers: headers);
  }

  Future<http.Response> getAllUserData(id) async {
    final url = Uri.parse("http://10.0.2.2:5000/post/user/all/$id");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    return http.post(url, headers: headers);
  }

  Future<http.Response> likePost(userId, postId) async {
    final url = Uri.parse("http://10.0.2.2:5000/post/like/$userId");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    var body = jsonEncode({"post_id": postId});

    return http.put(url, headers: headers, body: body);
  }
}
