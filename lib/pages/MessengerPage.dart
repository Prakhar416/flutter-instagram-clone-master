import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/widgets/MessengerPageWidgets/MessengerList.dart';
import 'package:provider/provider.dart';

class MessengerPage extends StatefulWidget {
  @override
  _MessengerPageState createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context, listen: false);

    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      state.changePage(1);
                    },
                    child: Container(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    child: Text(
                      "Messenger",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.grey[800],
            ),
            MessengerList(),
          ],
        ),
      ),
    );
  }
}
