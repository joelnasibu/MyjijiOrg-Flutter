import 'package:flutter/material.dart';
import 'package:organizer/screen/bookings/pbookings.dart';
import 'package:organizer/screen/bookings/tbookings.dart';
import 'package:organizer/style.dart';


class Bookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtBookings();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtBookings();
          } 
          else {
            return TabBookings();
          }
        },
      ),
    );
  }
}