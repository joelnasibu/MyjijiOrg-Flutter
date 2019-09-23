import 'package:flutter/material.dart';


class SlideLeft extends PageRouteBuilder{
  Widget widget;

  SlideLeft({this.widget}): super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return widget;
      },

      transitionDuration: Duration(seconds: 2),

      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
            Animation <Offset> custom = Tween<Offset>(
                                 begin: Offset(-1.0,0.0),
                                 end: Offset(0.0,0.0) 
                               ).animate(animation);
    
     return SlideTransition(position: custom,child: child);
    
      }
  );

}



