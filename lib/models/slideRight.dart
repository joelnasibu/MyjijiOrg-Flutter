import 'package:flutter/material.dart';


class SlideRight extends PageRouteBuilder{
  Widget widget;
  int time;

  SlideRight({this.widget,this.time}): super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return widget;
      },

      transitionDuration: Duration(milliseconds: time),

      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
            Animation <Offset> custom = Tween<Offset>(
                                 begin: Offset(1.0,0.0),
                                 end: Offset(0.0,0.0) 
                               ).animate(animation);
    
     return SlideTransition(position: custom,child: child);
    
      }
  );

}



