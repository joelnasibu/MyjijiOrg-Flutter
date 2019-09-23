import 'package:flutter/material.dart';
import 'package:organizer/screen/confirm_number/pConfirm.dart';
import 'package:organizer/screen/confirm_number/tConfirm.dart';

class ConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtConfirm();
          } else {
            return TabConfirm();
          }
        },
      ),
    );
  }
}
