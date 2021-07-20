import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/SharedWidgets/ShimmerImageLoader.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [Colors.red.shade900, Colors.yellow.shade700],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 23,
                child: ShimmerImageLoader(
                  radius: 23.0,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Name",
              style: TextStyle(color: Colors.white, fontSize: 10),
            )
          ],
        ),
      ],
    );
  }
}
