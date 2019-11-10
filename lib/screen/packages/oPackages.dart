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
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.black),
        onPressed: (){
                Route route = SlideLeft(
                  widget: AddPackages(),
                  time: 500
                );
                Navigator.push(context, route);
              },
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
