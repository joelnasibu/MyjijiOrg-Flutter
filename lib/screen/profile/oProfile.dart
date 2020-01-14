import 'package:flutter/material.dart';
import 'package:organizer/screen/profile/pProfile.dart';
import 'package:organizer/screen/profile/tProfile.dart';
import 'package:organizer/style.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth <= WidthDimension) {
                  return PrtProfile();
                } else if (constraints.maxWidth >TabwidthDimension){
                  return PrtProfile();
                } 
                else {
                  return TabProfile();
                }
              },
      ),
              
 


    );
  }
}