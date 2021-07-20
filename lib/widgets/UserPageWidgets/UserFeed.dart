import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/SharedWidgets/ShimmerGridLoader.dart';
import 'package:provider/provider.dart';

class UserFeed extends StatelessWidget {
  var postsLoading;
  var posts;

  UserFeed({this.posts = const [], this.postsLoading = false});

  @override
  Widget build(BuildContext context) {
    // Future<void> getOwnPosts() async {
    //   var appState = Provider.of<AppState>(context, listen: false);
    //   await Provider.of<PostState>(context, listen: false)
    //       .getOwnPosts(appState.user.id.toString());
    // }

    var url = "https://storage.googleapis.com/instagram-clone/";

    return Expanded(
      child: posts.length == 0
          ? Center(child: Text('No Post To Show'))
          : postsLoading == true
              ? ShimmerGridLoader()
              : GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3),
                  itemCount: posts.length,
                  itemBuilder: (_, index) {
                    var image = posts[index];
                    return GestureDetector(
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(url + image.postImageUrl)),
                    );
                  },
                ),
    );
  }
}
