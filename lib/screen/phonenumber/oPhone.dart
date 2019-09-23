import 'package:flutter/material.dart';
import 'package:organizer/screen/phonenumber/pPhone.dart';
import 'package:organizer/screen/phonenumber/tPhone.dart';

class PhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtPhone();
          } else {
            return TabPhone();
          }
        },
      ),
    );
  }
}
