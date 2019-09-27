import 'package:flutter/material.dart';
import 'package:organizer/screen/confirm_number/pConfirm.dart';
import 'package:organizer/screen/confirm_number/tConfirm.dart';
import 'package:organizer/style.dart';

class ConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtConfirm();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtConfirm();
          } 
          else {
            return TabConfirm();
          }
        },
      ),
    );
  }
}
