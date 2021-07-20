import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/MessengerPageWidgets/User.dart';

class MessengerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          User(),
          User(),
          User(),
          User(),
          User(),
          User(),
          User(),
          User(),
        ],
      ),
    );
  }
}
