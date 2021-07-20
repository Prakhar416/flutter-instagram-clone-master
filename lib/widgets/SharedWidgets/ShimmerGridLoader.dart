import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/SharedWidgets/ShimmerImageLoader.dart';

class ShimmerGridLoader extends StatelessWidget {
  var crossAxisCount;
  var gridCount;

  ShimmerGridLoader({this.crossAxisCount = 3, this.gridCount = 15});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: List.generate(gridCount, (index) {
        return Container(
            padding: EdgeInsets.all(1), child: ShimmerImageLoader());
      }),
    );
  }
}
