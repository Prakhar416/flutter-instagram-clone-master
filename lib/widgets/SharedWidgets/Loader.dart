import 'package:flutter/material.dart';
import 'package:insta_clone/shared/variables.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Globals.black,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Globals.white,
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation<Color>(Globals.white),
          ),
        ),
      ),
    );
  }
}
