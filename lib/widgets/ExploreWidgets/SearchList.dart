import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/SearchState.dart';
import 'package:insta_clone/widgets/ExploreWidgets/SearchUser.dart';
import 'package:provider/provider.dart';

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<SearchState>(context);

    return ListView.builder(
        itemCount: userState.users.length,
        itemBuilder: (context, index) {
          var user = userState.users[index];

          return SearchUser(
            userName: user.userName,
            firstName: user.firstName,
            lastName: user.lastName,
            userId: user.id,
            profileImage: user.profileImage,
          );
        });
  }
}
