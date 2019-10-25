import 'package:flutter/material.dart';
import 'package:organizer/models/slideleft.dart';
import 'package:organizer/screen/packages/oAddPack.dart';
import 'package:organizer/screen/packages/pPackages.dart';
import 'package:organizer/screen/packages/tPackages.dart';
import 'package:organizer/style.dart';

class Packages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Colors.white,
        title: Text('Packages & Admissions',style: TextStyle(
            color: Colors.black,fontSize: NormalFonteSize
          ),
        
        ),  
        
        actions: <Widget>[
           IconButton(
              icon:Icon(Icons.add),
              color:Colors.black,
              onPressed: (){
                Route route = SlideLeft(
                  widget: AddPackages(),
                  time: 500
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
            return PrtPackages();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtPackages();
          } 
          else {
            return TabPackages();
          }
        },
    )
    );
  }
}
