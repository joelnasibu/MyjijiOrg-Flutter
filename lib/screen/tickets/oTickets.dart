import 'package:flutter/material.dart';
import 'package:organizer/models/slideleft.dart';
import 'package:organizer/screen/createEvent/oCreateEvent.dart';
import 'package:organizer/screen/tickets/pTickets.dart';
import 'package:organizer/screen/tickets/tTickets.dart';
import 'package:organizer/style.dart';

class Tickets extends StatefulWidget {
  @override
  TicketsState createState() => TicketsState();
}

class TicketsState extends State<Tickets> with SingleTickerProviderStateMixin{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add,color:Colors.black),
      ),        
      
 
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtTickets();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtTickets();
          } 
          else {
            return TabTickets();
          }
        },
      )
      );
}
}
         