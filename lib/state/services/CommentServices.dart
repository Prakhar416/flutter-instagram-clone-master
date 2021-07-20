import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentServices {
  Future<http.Response> getComments(postId) async {
    var id = postId;
    final url = Uri.parse("http://10.0.2.2:5000/post/comments/$id");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    var body = jsonEncode({"post_id": postId});

    return http.post(url, headers: headers, body: body);
  }

  Future<http.Response> postComment(id, postId, comment) async {
    final url = Uri.parse("http://10.0.2.2:5000/post/comment/add/$id");
    // final token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      // "auth-token": "$token"
    };

    var body = jsonEncode({"post_id": postId, "comment": comment});

    return http.post(url, headers: headers, body: body);
  }
}
