import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/FeedWidgets/Story.dart';

class StoryFeed extends StatefulWidget {
  @override
  _StoryFeedState createState() => _StoryFeedState();
}

class _StoryFeedState extends State<StoryFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story()
          ],
        ),
      ),
    );
  }
}
