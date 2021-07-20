import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:provider/provider.dart';

class ButtonsGroup extends StatelessWidget {
  var userId;
  var followUser;

  ButtonsGroup({this.userId, this.followUser});
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: OutlinedButton(
                autofocus: true,
                onPressed: () {
                  followUser();
                },
                child: Text(
                  appState.user.following.contains(userId)
                      ? "Following"
                      : "Follow",
                  style: TextStyle(fontSize: 13),
                ),
                style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: appState.user.following.contains(userId)
                        ? Colors.blue
                        : Colors.black,
                    padding: EdgeInsets.all(0),
                    side: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: OutlinedButton(
                autofocus: true,
                onPressed: () {},
                child: Text(
                  "Message",
                  style: TextStyle(fontSize: 13),
                ),
                style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    // backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(0),
                    side: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
