import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  Future<http.Response> fetchUser(token) async {
    final url = Uri.parse("http://10.0.2.2:5000/auth/user");
    final headers = {
      "Content-type": "application/json",
      "auth-token": "$token"
    };

    return http.get(url, headers: headers);
  }

  Future<http.Response> login(data) async {
    final url = Uri.parse("http://10.0.2.2:5000/auth/login");
    final headers = {"Content-type": "application/json"};
    final user = jsonEncode(data);

    return http.post(url, headers: headers, body: user).timeout(Duration(
          seconds: 10,
        ));
  }

  Future<http.Response> register(data) async {
    final url = Uri.parse("http://10.0.2.2:5000/auth/register");
    final headers = {"Content-type": "application/json"};
    final user = jsonEncode(data);

    return http.post(url, headers: headers, body: user);
  }
}
