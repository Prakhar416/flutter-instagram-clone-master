import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/widgets/SharedWidgets/Input.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    register() {
      if (_formKey.currentState!.validate()) {
        var user = {
          'email': email.text,
          "user_name": userName.text,
          'password': password.text,
          'first_name': firstName.text,
          'last_name': lastName.text
        };
        state.register(user).then((value) {
          if (Provider.of<AppState>(context, listen: false).isAuthentificated) {
            Navigator.pop(context);
          }
        });
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
            controller: userName,
            hintText: "Enter A User Name",
            validator: 'Please Enter An User Name',
          ),
          Input(
              controller: password,
              hintText: "Enter A Password",
              validator: 'Please Enter A Password',
              obscureText: true),
          Input(
            controller: firstName,
            hintText: "Enter Your First Name",
            validator: 'Please Enter A First Name',
          ),
          Input(
            controller: lastName,
            hintText: "Enter Your Last Name",
            validator: 'Please Enter A Last Name',
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: FlatButton(
              onPressed: () => register(),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
