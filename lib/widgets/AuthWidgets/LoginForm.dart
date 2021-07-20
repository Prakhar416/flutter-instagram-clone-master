import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/SharedWidgets/Input.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    login() {
      if (_formKey.currentState!.validate()) {
        var user = {'email': email.text, 'password': password.text};
        appState.login(user);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Input(
            controller: email,
            hintText: "Enter An Email",
            validator: 'Please Enter An Email',
          ),
          Input(
            controller: password,
            hintText: "Enter A Password",
            validator: 'Please Enter A Password',
            obscureText: true,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: FlatButton(
              onPressed: () => login(),
              child: Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
