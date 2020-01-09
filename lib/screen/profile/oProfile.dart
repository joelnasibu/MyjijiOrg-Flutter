import 'package:flutter/material.dart';
import 'package:organizer/screen/profile/pProfile.dart';
import 'package:organizer/screen/profile/tProfile.dart';
import 'package:organizer/style.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.transparent,
      extendBody: true,
      // appBar: AppBar(        
      //  // backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title:Text('Profle'),
      //   leading: IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: (){
      //       Scaffold.of(context).openDrawer();
      //     },
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.more_vert),
      //       onPressed: (){
      //         //pop up Menu to Edit Profile
      //       },
      //     ),
      //   ],
      
      // ),
         
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