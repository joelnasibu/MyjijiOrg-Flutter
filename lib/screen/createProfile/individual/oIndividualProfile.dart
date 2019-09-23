import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/individual/pIndividualProfile.dart';
import 'package:organizer/screen/createProfile/individual/tIndividualProfile.dart';

class IndividualProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtIndividualProfile();
          } else {
            return TabIndividualProfile();
          }
        },
      ),
    );
  }
}
