import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/Helpers.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comment extends StatelessWidget {
  var firstName;
  var lastName;
  var comment;
  var date;

  Comment(
      {this.comment = "",
      this.firstName = 'User',
      this.lastName = 'Name',
      this.date = "12"});
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(date.toString());
    var formatedTime = timeago.format(time, locale: 'en');

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: [Colors.red.shade900, Colors.yellow.shade700],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${capitalize(firstName)}: ',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      comment,
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade500),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    date == null ? "" : '${capitalize(formatedTime)}',
                    style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
