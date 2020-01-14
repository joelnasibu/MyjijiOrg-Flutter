import 'package:flutter/material.dart';


class StreightClip extends CustomClipper<Path> {
  
  double x;
  double y;
  double adjustX = 1.0;
  double adjustY = 1.0;

  StreightClip({this.x,this.y,this.adjustX,this.adjustY});

  @override
  getClip(Size size) {
    // TODO: implement getClip

    var path = Path();
    path.lineTo(x,size.height*adjustY);
    path.lineTo(size.width*adjustX,size.height * adjustY);
   path.lineTo(size.width,y);
   // path.lineTo(x, y);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }


}