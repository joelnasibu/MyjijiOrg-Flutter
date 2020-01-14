import 'package:flutter/material.dart';
import 'package:organizer/models/slideRight.dart';
import 'package:organizer/screen/analytics/pAnalytics.dart';
import 'package:organizer/screen/analytics/tAnalytics.dart';
import 'package:organizer/screen/createEvent/oCreateEvent.dart';
import 'package:organizer/style.dart';

class Analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Analytics'),
       
        actions: <Widget>[
          
           IconButton(
            icon:Icon(Icons.more_vert),
            onPressed: (){},
          ),
        ],
      ),
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtAnalytics();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtAnalytics();
          } 
          else {
            return TabAnalytics();
          }
        },
      )
    );
  }
}
