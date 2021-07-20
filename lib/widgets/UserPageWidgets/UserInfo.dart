import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/Helpers.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  var posts;
  var followers;
  var following;
  var firstName;

  UserInfo(
      {this.posts = const [],
      this.firstName = 'No Name',
      this.followers = const [],
      this.following = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      colors: [Colors.red.shade900, Colors.yellow.shade700],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 23,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          posts.length.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        Text(
                          "Posts",
                          style: TextStyle(fontSize: 12, letterSpacing: 1),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          followers.length.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(fontSize: 12, letterSpacing: 1),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          following.length.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(fontSize: 12, letterSpacing: 1),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            capitalize(firstName),
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Set Description For user in backend",
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
