import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextLoader extends StatelessWidget {
  var text;
  var fontSize;
  var fontWeight;

  ShimmerTextLoader(
      {required this.text,
      this.fontSize = 10.0,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade200,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
