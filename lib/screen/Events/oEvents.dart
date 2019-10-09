import 'package:flutter/material.dart';
import 'package:organizer/screen/Events/pEvents.dart';
import 'package:organizer/screen/Events/tEvents.dart';
import 'package:organizer/style.dart';

class Events extends StatelessWidget {
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
            return PrtEvents();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtEvents();
          } 
          else {
            return TabEvents();
          }
        },
      ),
    );
  }
}
