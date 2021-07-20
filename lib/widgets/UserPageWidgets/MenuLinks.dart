import 'package:flutter/material.dart';
import 'package:insta_clone/shared/variables.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:provider/provider.dart';

class MenuLinks extends StatelessWidget {
  final text;
  final action;

  MenuLinks({this.text, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.settings),
        SizedBox(
          width: 10,
        ),
        TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14, color: Globals.grey),
            ),
            child: Text(text),
            onPressed: () {
              if (action == 'logout') {
                Provider.of<AppState>(context, listen: false).logout();
              }
            }),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
