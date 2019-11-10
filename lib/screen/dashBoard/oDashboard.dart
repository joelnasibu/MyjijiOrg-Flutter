import 'package:flutter/material.dart';
import 'package:organizer/models/slideRight.dart';
import 'package:organizer/screen/createEvent/oCreateEvent.dart';
import 'package:organizer/screen/dashBoard/pDashboard.dart';
import 'package:organizer/screen/dashBoard/tDashboard.dart';
import 'package:organizer/style.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Hot Event'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          }),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add_circle,size: 30,),
            onPressed: (){
              Route route = SlideRight(
                widget: CreateEvent(),
                time: 800
              );
              Navigator.push(context, route);
            },
          ),
           IconButton(
            icon:Icon(Icons.more_vert),
            onPressed: (){},
          ),
        ],
      ),
      body:LayoutBuilder(
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
      )
    );
  }
}
