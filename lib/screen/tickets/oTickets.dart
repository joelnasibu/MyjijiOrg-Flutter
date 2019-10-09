import 'package:flutter/material.dart';
import 'package:organizer/models/slideleft.dart';
import 'package:organizer/screen/createEvent/oCreateEvent.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/screen/tickets/pTickets.dart';
import 'package:organizer/screen/tickets/tTickets.dart';
import 'package:organizer/style.dart';

class Tickets extends StatefulWidget {
  @override
  TicketsState createState() => TicketsState();

}

class TicketsState extends State<Tickets> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animate;
  
  String bottomTitle = "";
  int _currentIndex = 0;
  Color _currentColor = Colors.white;
  double _currentSize = 20;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _animate = Tween(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller,curve:Curves.fastOutSlowIn));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Colors.white,
        title: Text('Tickets',style: TextStyle(
            color: Colors.black
          ),
        
        ),  
        actions: <Widget>[
           IconButton(
              icon:Icon(Icons.search),
              color:Colors.black,
              onPressed: (){},
            ),
            
            IconButton(
              icon:Icon(Icons.more_vert),
              color:Colors.black,
              onPressed: (){},
            ),
        ],     
      ),

       extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),  
        child: Container(          
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[  
              _listBottomFormat(Icons.home, "Home", Colors.white,0,25),            
              _listBottomFormat(Icons.dashboard, "DashBoard", Colors.white,1,25),            
              _listBottomFormat(Icons.attach_money, "Tickets", Colors.white,2,25),            
              _listBottomFormat(Icons.more_vert, "More", Colors.white,3,25),            
              
            ],
          ),
        ),
      ),      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(        
        child: Icon(Icons.add),
        onPressed: (){
          Route route = SlideLeft(
            widget: CreateEvent(),
            time:500
          );
          Navigator.push(context, route);
        },
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

  
  Widget _listBottomFormat(IconData icon, String title, Color color,int position,double size){
    return   Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
              child: Icon(icon,
              size: _currentIndex==position?_currentSize:size,
              color:_currentIndex==position
                    ?_currentColor:color),
              onTap: (){
                setState(() {
                  _currentIndex = position;
                  bottomTitle = title; 
                  _currentColor = Colors.yellow;
                  _currentSize = 30;

                });
              } 
            ),

          _currentIndex==position
              ? Text(bottomTitle,style: TextStyle(color: _currentColor,fontSize: TinyFontSize))
              : Text(''), 
        ],
    ));

  }
}

         