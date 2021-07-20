import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(5)),
      margin:
      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: FlatButton(
        onPressed: null,
        child: Text("Log In", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

// decoration: BoxDecoration(
//   gradient: LinearGradient(
//   colors: [Color.fromRGBO(207, 49, 87, 1) , Color.fromRGBO(181, 39, 129, 1) ],
//   begin: Alignment.topRight,
//   end: Alignment.bottomLeft),
// ),