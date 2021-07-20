import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchServices {
  Future<http.Response> followUser(id, userId) {
    final url = Uri.parse("http://10.0.2.2:5000/user/follow/$id");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    var body = jsonEncode({"user_id": userId});

    return http.put(url, headers: headers, body: body);
  }

  Future<http.Response> searchUser(search) {
    final url = Uri.parse("http://10.0.2.2:5000/user/search");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    var body = jsonEncode({"search": search});

    return http.post(url, headers: headers, body: body);
  }
}
