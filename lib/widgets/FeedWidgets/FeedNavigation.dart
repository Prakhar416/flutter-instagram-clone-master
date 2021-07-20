import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/SharedWidgets/CustomIcon.dart';
import 'package:provider/provider.dart';

class FeedNavigation extends StatefulWidget {
  @override
  _FeedNavigationState createState() => _FeedNavigationState();
}

class _FeedNavigationState extends State<FeedNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Instagram",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Billabong',
                fontSize: 30,
                letterSpacing: 3),
          ),
          Container(
            child: Row(children: [
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
                  iconName: "add.svg",
                  size: 20,
                  iconColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: GestureDetector(
                  onTap: () {
                    var appState =
                        Provider.of<AppState>(context, listen: false);
                    var postState =
                        Provider.of<PostState>(context, listen: false);

                    postState.getFriendsPosts(appState.user.id.toString());
                  },
                  child: CustomIcon(
                    iconName: "share.svg",
                    size: 20,
                    iconColor: Colors.white,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
