import 'package:flutter/material.dart';
import 'package:organizer/screen/packages/pAddPack.dart';
import 'package:organizer/screen/packages/pPackages.dart';
import 'package:organizer/screen/packages/tAddPack.dart';
import 'package:organizer/screen/packages/tPackages.dart';
import 'package:organizer/style.dart';

class AddPackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Colors.white,
        title: Text('New Package',style: TextStyle(
            color: Colors.black,fontSize: NormalFonteSize
          ),
        
        ),  
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[         
            
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
            return PrtAddPackages();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtAddPackages();
          } 
          else {
            return TabAddPackages();
          }
        },
    )
    );
  }
}
