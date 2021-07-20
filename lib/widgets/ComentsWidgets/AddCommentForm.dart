import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/CommentState.dart';
import 'package:provider/provider.dart';

class AddCommentForm extends StatelessWidget {
  var postId;

  AddCommentForm({this.postId});

  TextEditingController _comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addComment() async {
      var appState = Provider.of<AppState>(context, listen: false);
      var commentState = Provider.of<CommentState>(context, listen: false);

      await commentState.postComment(appState.user.id, postId, _comment.text);
    }

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        color: Colors.grey.shade900,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    colors: [Colors.red.shade900, Colors.yellow.shade700],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 14,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: _comment,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: "Search",
                  contentPadding: EdgeInsets.all(0),
                ),
              ),
            ),
            OutlinedButton(
              autofocus: true,
              onPressed: () {
                addComment();
                _comment.clear();
              },
              child: Text("Post"),
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(0),
                  side: BorderSide(color: Colors.grey.shade600)),
            ),
          ],
        ));
  }
}
