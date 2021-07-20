import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/CommentState.dart';
import 'package:insta_clone/widgets/ComentsWidgets/AddCommentForm.dart';
import 'package:insta_clone/widgets/ComentsWidgets/Comment.dart';
import 'package:insta_clone/widgets/SharedWidgets/Loader.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatelessWidget {
  var postId;
  var comments = [];
  CommentsPage({this.postId});

  @override
  Widget build(BuildContext context) {
    var commentState = Provider.of<CommentState>(context, listen: true);

    // print(comments);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              print("Back");
              Navigator.pop(context, true);
            }),
        title: Text(
          "Comments",
          style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            commentState.loadingComments == false
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                        itemCount: commentState.comments.length,
                        itemBuilder: (context, index) {
                          var comment = commentState.comments[index];

                          // print(index);

                          return Comment(
                              comment: comment.comment,
                              firstName: comment.firstName,
                              lastName: comment.lastName,
                              date: comment.createdAt);
                        },
                      ),
                    ),
                  )
                : Loader(),
            AddCommentForm(postId: postId)
          ],
        ),
      ),
    );
  }
}
