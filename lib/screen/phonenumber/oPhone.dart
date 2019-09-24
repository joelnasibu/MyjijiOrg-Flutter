import 'package:flutter/material.dart';
import 'package:organizer/screen/phonenumber/pPhone.dart';
import 'package:organizer/screen/phonenumber/tPhone.dart';
import 'package:organizer/style.dart';

class PhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtPhone();
          } else {
            return TabPhone();
          }
        },
      ),
    );
  }
}
