import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/individual/pIndividualProfile.dart';
import 'package:organizer/screen/createProfile/individual/tIndividualProfile.dart';
import 'package:organizer/style.dart';

class IndividualProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],        
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtIndividualProfile();
          } else {
            return TabIndividualProfile();
          }
        },
      ),
    );
  }
}
