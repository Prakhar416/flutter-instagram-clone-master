import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImageLoader extends StatelessWidget {
  double radius;

  ShimmerImageLoader({this.radius = 0.0});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade400,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: width,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: radius != 0.0 ? BorderRadius.circular(radius) : null,
            color: Colors.white,
          ),
        ));
  }
}
