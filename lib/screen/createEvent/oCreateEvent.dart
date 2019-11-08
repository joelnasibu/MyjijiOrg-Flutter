import 'package:flutter/material.dart';
import 'package:organizer/screen/createEvent/pCreateEvent.dart';
import 'package:organizer/screen/createEvent/tcreateEvent.dart';
import 'package:organizer/style.dart';

class CreateEvent extends StatelessWidget {
  
 // var globalformKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event',style:TextStyle(color:Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        actionsIconTheme: IconThemeData(
          color: AppPrimaryColor
        ),
       
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtCreateEvent();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtCreateEvent();
          } 
          else {
            return TabCreateEvent();
          }
        },
      ),
    );
  }
}
