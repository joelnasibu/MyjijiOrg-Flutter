import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/pCreateProfile.dart';
import 'package:organizer/screen/createProfile/tCreateProfile.dart';

class CreateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtCreateProfile();
          } else {
            return TabCreateProfile();
          }
        },
      ),
    );
  }
}
