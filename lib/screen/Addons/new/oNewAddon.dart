
import 'package:flutter/material.dart';
import 'package:organizer/screen/Addons/new/pNewAddon.dart';
import 'package:organizer/screen/Addons/new/tNewAddon.dart';
import 'package:organizer/style.dart';

class NewAddon extends StatefulWidget {
  @override
  _NewAddonState createState() => _NewAddonState();
}

class _NewAddonState extends State<NewAddon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Colors.white,
        title: Text('New Addon',style: TextStyle(
            color: Colors.black
          ),
        
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
            return PrtNewAddon();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtNewAddon();
          } 
          else {
            return TabNewAddon();
          }
        },
      )
      );
}
  
}