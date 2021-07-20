import 'package:flutter/material.dart';

import 'package:insta_clone/pages/ExplorePage.dart';
import 'package:insta_clone/pages/FeedPage.dart';
import 'package:insta_clone/pages/MessengerPage.dart';
import 'package:insta_clone/pages/MyProfilePage.dart';
import 'package:insta_clone/pages/ReelsPage.dart';
import 'package:insta_clone/pages/ShopPage.dart';
import 'package:insta_clone/pages/NewPostPage.dart';
import 'package:insta_clone/shared/variables.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';

import 'package:insta_clone/widgets/SharedWidgets/CustomIcon.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var currentTab = 0;

  List<Widget> pages = [
    FeedPage(),
    ExplorePage(),
    ReelsPage(),
    ShopPage(),
    MyProfilePage()
  ];

  void fetchDataOnTabChange() async {
    var appState = Provider.of<AppState>(context, listen: false);
    var postState = Provider.of<PostState>(context, listen: false);

    switch (currentTab) {
      case 0:
        // Get Friends Post
        if (postState.feedPosts.length == 0) {
          print('App: Get Friends Posts');
          await postState.getFriendsPosts(appState.user.id.toString());
        }
        break;
      case 1:
        // Get Explore Posts
        if (postState.explorePosts.length == 0) {
          print('App: Get Explore Posts');
          await postState.getAllPosts();
        }
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        // Get Own Posts
        if (postState.ownPosts.length == 0) {
          print('App: Get Own Posts');
          await postState.getOwnPosts(appState.user.id.toString());
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context, listen: false);

    return PageView(
      controller: state.controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        NewPostPage(),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            fixedColor: Colors.white,
            elevation: 0,
            onTap: (index) {
              setState(() {
                currentTab = index;
                fetchDataOnTabChange();
              });
            },
            currentIndex: currentTab,
            items: [
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconName: "home.svg",
                  size: 20,
                  iconColor: currentTab == 0 ? Globals.white : Globals.grey,
                ),
                title: Container(height: 0.0),
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconName: "search.svg",
                  size: 20,
                  iconColor: currentTab == 1 ? Globals.white : Globals.grey,
                ),
                title: Container(height: 0.0),
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconName: "reels.svg",
                  size: 20,
                  iconColor: currentTab == 2 ? Globals.white : Globals.grey,
                ),
                title: Container(height: 0.0),
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconName: "shop.svg",
                  size: 20,
                  iconColor: currentTab == 3 ? Globals.white : Globals.grey,
                ),
                title: Container(height: 0.0),
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconName: "add.svg",
                  size: 20,
                  iconColor: currentTab == 4 ? Globals.white : Globals.grey,
                ),
                title: Container(height: 0.0),
              ),
            ],
          ),
          body: IndexedStack(
            children: pages,
            index: currentTab,
          ),
        ),
        MessengerPage()
      ],
    );
  }
}
