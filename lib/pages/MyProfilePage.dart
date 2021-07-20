import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/Helpers.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/UserPageWidgets/Menu.dart';
import 'package:insta_clone/widgets/UserPageWidgets/UserFeed.dart';
import 'package:insta_clone/widgets/UserPageWidgets/UserInfo.dart';
import 'package:provider/provider.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  // void getUser() async {
  //   var postState = Provider.of<PostState>(context);

  //   await postState.getAllUsersPosts(widget.userId);
  // }

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var postState = Provider.of<PostState>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '${capitalize(appState.user.firstName)} ${capitalize(appState.user.lastName)}',
          style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 1),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            UserInfo(
              posts: postState.ownPosts,
              firstName: appState.user.firstName,
              followers: appState.user.followers,
              following: appState.user.following,
            ),
            Divider(
              height: 20,
              thickness: 2,
            ),
            UserFeed(
              posts: postState.ownPosts,
              postsLoading: postState.ownPostsLoading,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Menu(),
      ),
    );
  }
}
