import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/AuthWidgets/RegisterForm.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100, bottom: 30),
                  child: Center(
                    child: Text(
                      "Instagram",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Billabong',
                          fontSize: 50,
                          letterSpacing: 3),
                    ),
                  ),
                ),
                RegisterForm(),
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          " Sign in Here",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
