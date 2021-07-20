import 'package:flutter/material.dart';
import 'package:insta_clone/pages/auth/Register.dart';
import 'package:insta_clone/widgets/AuthWidgets/LoginForm.dart';

// #b52781 roz inchis

// #cf3157 roz deschis

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
            LoginForm(),
            ForgotPassword(),
            RegisterButton()
          ],
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dont Have an Account yet?'),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            child: Text(
              " Sign Up Here",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Register()),
          );
        },
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.blue, fontSize: 12),
        ),
      ),
    );
  }
}
