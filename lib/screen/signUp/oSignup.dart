import 'package:flutter/material.dart';
import 'package:organizer/screen/signUp/pSignUp.dart';
import 'package:organizer/screen/signUp/tSignUp.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtSignUp();
          } else {
            return TabSignUp();
          }
        },
      ),
    );
  }
}
