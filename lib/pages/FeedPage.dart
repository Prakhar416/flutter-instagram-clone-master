import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/FeedWidgets/FeedNavigation.dart';
import 'package:insta_clone/widgets/FeedWidgets/PostFeed.dart';
import 'package:insta_clone/widgets/FeedWidgets/StoryFeed.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            FeedNavigation(),
            StoryFeed(),
            Divider(
              height: 10,
              color: Colors.grey[700],
            ),
            PostFeed(),
          ],
        ),
      ),
    );
  }
}
