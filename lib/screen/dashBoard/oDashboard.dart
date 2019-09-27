import 'package:flutter/material.dart';
import 'package:organizer/screen/dashBoard/pDashboard.dart';
import 'package:organizer/screen/dashBoard/tDashboard.dart';
import 'package:organizer/style.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot Event'),
      ),
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtDashBoard();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtDashBoard();
          } 
          else {
            return TabDashBoard();
          }
        },
      ),
    );
  }
}
