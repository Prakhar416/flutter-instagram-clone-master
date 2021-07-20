import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
// import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/FeedWidgets/Post.dart';
import 'package:insta_clone/widgets/SharedWidgets/CustomIcon.dart';
import 'package:insta_clone/widgets/SharedWidgets/ShimmerImageLoader.dart';
import 'package:insta_clone/widgets/SharedWidgets/ShimmerTextLoader.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class PostFeed extends StatefulWidget {
  @override
  _PostFeedState createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  Future<void> refreshPosts() async {
    var appState = Provider.of<AppState>(context, listen: false);
    var postState = Provider.of<PostState>(context, listen: false);
    await postState.getFriendsPosts(appState.user.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    var postState = Provider.of<PostState>(context, listen: true);

    return Expanded(
      child: postState.feedPostsLoading == true
          ? ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                LoadingPosts(),
                LoadingPosts(),
                LoadingPosts(),
              ],
            )
          : RefreshIndicator(
              onRefresh: refreshPosts,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: postState.feedPosts.length,
                itemBuilder: (context, index) {
                  var url = "https://storage.googleapis.com/instagram-clone/";

                  var post = postState.feedPosts[index];

                  // print(postState.feedPosts[index].postImageUrl);

                  // print(post.likes.contains(appState.user.id));

                  // print(post.id);

                  return postState.feedPosts.length == 0
                      ? Center(child: Text("No Post To Show"))
                      : Post(
                          id: post.id,
                          userId: post.userId,
                          firstName: post.firstName,
                          lastName: post.lastName,
                          imageUser: url + post.postImageUrl,
                          imagePost: url + post.postImageUrl,
                          createdAt: post.createdAt,
                          comments: post.comments,
                          likes: post.likes,
                          description: post.description,
                          index: index,
                          liked: post.likes.contains(appState.user.id));
                },
              ),
            ),
    );
  }
}

class LoadingPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: ShimmerImageLoader(
                          radius: 23.0,
                        ),
                      ),
                      SizedBox(width: 10),
                      ShimmerTextLoader(text: "Name")
                    ],
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
              // height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                    color: Colors.grey.shade900),
              ),
              child: ShimmerImageLoader()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomIcon(
                    iconName: "heart.svg",
                    size: 20,
                    iconColor: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomIcon(
                    iconName: "comment.svg",
                    size: 20,
                    iconColor: Colors.white,
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
              "Liked by Shara Doe and 200 others",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ShimmerTextLoader(text: "Description")),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: ShimmerTextLoader(text: "Comments"),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: ShimmerTextLoader(text: "Created At")),
        ],
      ),
    );
  }
}
