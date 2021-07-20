import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/Helpers.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/state/provider/SearchState.dart';
import 'package:insta_clone/widgets/UserPageWidgets/ButtonsGroup.dart';
import 'package:insta_clone/widgets/UserPageWidgets/UserFeed.dart';
import 'package:insta_clone/widgets/UserPageWidgets/UserInfo.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var searchState = Provider.of<SearchState>(context);
    var postState = Provider.of<PostState>(context);

    var user = postState.userPageData['user'];
    var posts = postState.userPageData['posts'];

    followUser() async {
      if (appState.user.id == user.id) return;

      if (appState.user.following.contains(user.id)) {
        user.followers.remove(appState.user.id);
        appState.user.following.remove(user.id);
      } else {
        user.followers.add(appState.user.id);
        appState.user.following.add(user.id);
      }

      searchState.followUser(appState.user.id, user.id);
    }

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
          '${capitalize(user.firstName)} ${capitalize(user.lastName)}',
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
            UserInfo(
              posts: posts,
              firstName: user.firstName,
              followers: user.followers,
              following: user.following,
            ),
            Divider(
              height: 10,
              thickness: 2,
            ),
            ButtonsGroup(userId: user.id, followUser: followUser),
            Divider(
              height: 10,
              thickness: 2,
            ),
            UserFeed(
              posts: posts,
            ),
          ],
        ),
      ),
    );
  }
}
