import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                colors: [Colors.red.shade900, Colors.yellow.shade700],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_2.jpg"),
            backgroundColor: Colors.white,
            radius: 20,
          ),
        ),
        title: Text(
          "John Doe",
          style: TextStyle(fontSize: 13),
        ),
        subtitle: Text(
          "Last active 1 hour ago",
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
