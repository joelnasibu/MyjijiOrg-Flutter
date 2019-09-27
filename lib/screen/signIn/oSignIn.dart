import 'package:flutter/material.dart';
import 'package:organizer/screen/signIn/pSignIn.dart';
import 'package:organizer/screen/signIn/tSignIn.dart';
import 'package:organizer/style.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtSignIn();
          }else if (constraints.maxWidth >TabwidthDimension){
            return PrtSignIn();
          } 
          else {
            return TabSignIn();
          }
        },
      ),
    );
  }
}
