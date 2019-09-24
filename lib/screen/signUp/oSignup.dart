import 'package:flutter/material.dart';
import 'package:organizer/screen/signUp/pSignUp.dart';
import 'package:organizer/screen/signUp/tSignUp.dart';
import 'package:organizer/style.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtSignUp();
          } else {
            return TabSignUp();
          }
        },
      ),
    );
  }
}
