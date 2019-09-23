import 'package:flutter/material.dart';
import 'package:organizer/screen/signIn/pSignIn.dart';
import 'package:organizer/screen/signIn/tSignIn.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtSignIn();
          } else {
            return TabSignIn();
          }
        },
      ),
    );
  }
}
