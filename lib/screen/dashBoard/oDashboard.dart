import 'package:flutter/material.dart';
import 'package:organizer/screen/dashBoard/pDashboard.dart';
import 'package:organizer/screen/dashBoard/tDashboard.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtDashBoard();
          } else {
            return TabDashBoard();
          }
        },
      ),
    );
  }
}
