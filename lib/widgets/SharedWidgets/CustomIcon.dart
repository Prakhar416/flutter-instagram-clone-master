import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String iconName;
  final Color iconColor;
  final double size;

  CustomIcon(
      {this.iconName = "", this.iconColor = Colors.white, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName',
      color: iconColor,
      width: size,
      height: size,
    );
  }
}
