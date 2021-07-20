import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final controller;
  final hintText;
  final validator;
  final obscureText;

  Input(
      {this.controller,
      this.hintText,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(250, 250, 250, 0.2),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validator;
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(fontSize: 14, color: Colors.white, letterSpacing: 1),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(0),
          isDense: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
