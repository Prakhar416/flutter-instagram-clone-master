import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/Helpers.dart';
import 'package:insta_clone/shared/variables.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/widgets/UserPageWidgets/MenuLinks.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    logout() {
      Provider.of<AppState>(context, listen: false).logout();
    }

    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${capitalize(state.user.firstName)} ${capitalize(state.user.lastName)}',
                style: TextStyle(
                    color: Colors.white, fontSize: 14, letterSpacing: 1),
              ),
              Divider(
                height: 20,
                thickness: 2,
              ),
              MenuLinks(
                text: "Saved",
              ),
              MenuLinks(
                text: "Edit Profile",
              ),
              MenuLinks(
                text: "Settings",
              ),
              MenuLinks(
                text: "Logout",
                action: "logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
