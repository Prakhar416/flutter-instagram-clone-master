import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/Helpers.dart';
import 'package:insta_clone/pages/CommentsPage.dart';
import 'package:insta_clone/pages/UserPage.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/CommentState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/SharedWidgets/CustomIcon.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';

import 'package:timeago/timeago.dart' as timeago;

class Post extends StatelessWidget {
  final String imageUser;
  final String imagePost;
  final int index;
  final String email;
  final String firstName;
  final String lastName;
  final String userName;
  final List<dynamic> likes;
  final List comments;
  final String id;
  final String userId;
  final String description;
  var createdAt;
  bool liked;

  Post({
    this.imagePost = "",
    this.imageUser = "",
    this.index = 0,
    this.email = "",
    this.firstName = "",
    this.lastName = "",
    this.userName = "",
    this.likes = const [],
    this.comments = const [],
    this.id = "",
    this.userId = "",
    this.description = "",
    this.createdAt,
    this.liked = false,
  });

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    var postState = Provider.of<PostState>(context, listen: false);
    var commentState = Provider.of<CommentState>(context, listen: false);

    DateTime time = DateTime.parse(createdAt.toString());
    var formatedTime = timeago.format(time, locale: 'en');

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (userId == appState.user.id) {
                      print("Same User");
                    } else {
                      var user = await postState.getAllUserData(userId);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(),
                          ));
                    }
                  },
                  child: Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          backgroundImage: NetworkImage(imageUser),
                        ),
                        SizedBox(width: 10),
                        Text(
                          firstName + " " + lastName,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: CustomIcon(
                    iconName: "more.svg",
                    size: 20,
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                    color: Colors.grey.shade900),
              ),
              child:
                  // Image(
                  //   isAntiAlias: true,
                  //   filterQuality: FilterQuality.high,
                  //   image: NetworkImage(imagePost),
                  // ),
                  //
                  // PinchZoom(
                  //   image: Image.network(
                  //     imagePost,
                  //     filterQuality: FilterQuality.high,
                  //   ),
                  //   zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                  //   resetDuration: const Duration(milliseconds: 100),
                  //   maxScale: 5,
                  // ),

                  //
                  CachedNetworkImage(
                filterQuality: FilterQuality.high,
                imageUrl: imagePost,
                imageBuilder: (context, imageProvider) => Image(
                  isAntiAlias: true,
                  filterQuality: FilterQuality.high,
                  image: NetworkImage(imagePost),
                ),
                placeholder: (context, url) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      )));
                },
                errorWidget: (context, url, error) => Icon(Icons.error),
              )

              // fit: BoxFit.fitWidth,
              ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: GestureDetector(
                    onTap: () {
                      var user = appState.user;

                      postState.likePost(user, id, index);
                    },
                    child: CustomIcon(
                      iconName: liked ? "loved.svg" : "heart.svg",
                      size: 20,
                      iconColor: liked ? Colors.red : Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: GestureDetector(
                    onTap: () async {
                      commentState.getComments(id);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentsPage(postId: id),
                          ));
                    },
                    child: CustomIcon(
                      iconName: "comment.svg",
                      size: 20,
                      iconColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomIcon(
                    iconName: "share.svg",
                    size: 20,
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              likes.length == 0
                  ? 'No Likes To This Post Yet'
                  : "Liked By ${likes.length} People",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          description.length == 0
              ? Container()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: 9,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Text(
              comments.length == 0
                  ? "No comments yet."
                  : "View all ${comments.length} comments",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 9,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Text(
              createdAt == null ? "" : '${capitalize(formatedTime)}',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
