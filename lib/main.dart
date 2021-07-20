// @dart=2.9

import 'package:flutter/material.dart';
import 'package:insta_clone/pages/auth/Login.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/CommentState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/state/provider/SearchState.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppState()),
        ChangeNotifierProvider(create: (context) => PostState()),
        ChangeNotifierProvider(create: (context) => SearchState()),
        ChangeNotifierProvider(create: (context) => CommentState()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "instagram Clone",
          home: MainPage(),
          theme: ThemeData(
            brightness: Brightness.dark,
            // primaryColor: Colors.white,
            // accentColor: Colors.white,
          ),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var state = Provider.of<AppState>(context, listen: false);
      await state.fetchUser();

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        print("Started fetching posts");
        await Provider.of<PostState>(context, listen: false)
            .getFriendsPosts((state.user.id));
        print("Finished fetching posts");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return state.isAuthentificated == true ? App() : Login();
    // return state.isLoading == false
    //     ? state.isAuthentificated == true
    //         ? App()
    //         : Login()
    //     : Loader();
  }
}
