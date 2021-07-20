import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/Helpers.dart';
import 'package:insta_clone/pages/UserPage.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:provider/provider.dart';

class SearchUser extends StatelessWidget {
  String userName;
  String firstName;
  String lastName;
  String userId;
  var profileImage;
  String url = Variables().url;

  SearchUser(
      {this.userName = '',
      this.firstName = '',
      this.lastName = '',
      this.userId = '',
      this.profileImage});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var postState = Provider.of<PostState>(context);

    return GestureDetector(
      onTap: () async {
        if (userId == appState.user.id) {
          print("Same User");
        } else {
          print(userId);
          await postState.getAllUserData(userId);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserPage(),
              ));
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [Colors.red.shade900, Colors.yellow.shade700],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
              ),
              child: profileImage == null
                  ? CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/instagram-default-profile-picture.png'),
                      backgroundColor: Colors.white,
                      radius: 20,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(url + profileImage),
                      backgroundColor: Colors.white,
                      radius: 20,
                    ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "$firstName $lastName",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
