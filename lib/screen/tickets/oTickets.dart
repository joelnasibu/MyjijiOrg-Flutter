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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(        
        backgroundColor: Colors.white,
        title: Text('Tickets',style: TextStyle(
            color: Colors.black
          ),
        
        ),  
        actions: <Widget>[
           IconButton(
              icon:Icon(Icons.add),
              color:Colors.black,
              onPressed: (){
                Route route = SlideLeft(
                widget: CreateEvent(),
                time:800
              );
            Navigator.push(context, route);
              },
            ),
            
            IconButton(
              icon:Icon(Icons.more_vert),
              color:Colors.black,
              onPressed: (){},
            ),
        ],     
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
         