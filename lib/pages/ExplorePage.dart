import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/SearchState.dart';

// WIDGETS
import 'package:insta_clone/widgets/ExploreWidgets/ExploreGridFeed.dart';
import 'package:insta_clone/widgets/ExploreWidgets/SearchBar.dart';

// STATE
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/ExploreWidgets/SearchList.dart';
import 'package:insta_clone/widgets/SharedWidgets/CustomIcon.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool isTyping = false;

  onIsTyping(value) {
    print(value);
    setState(() {
      isTyping = value;
    });

    if (value == false) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchBar(
              isTyping: isTyping,
              onIsTyping: onIsTyping,
            ),
            Expanded(
                child: isTyping == false ? ExploreGridFeed() : SearchList()),
            //
          ],
        ),
      ),
    );
  }
}
