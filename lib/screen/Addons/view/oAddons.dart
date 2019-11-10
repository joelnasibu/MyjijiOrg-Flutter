
import 'package:flutter/material.dart';
import 'package:organizer/screen/Addons/new/pNewAddon.dart';
import 'package:organizer/screen/Addons/new/tNewAddon.dart';
import 'package:organizer/screen/Addons/view/pAddons.dart';
import 'package:organizer/screen/Addons/view/tAddons.dart';
import 'package:organizer/screen/packages/pAddPack.dart';
import 'package:organizer/style.dart';

class Addons extends StatefulWidget {
  @override
  _AddonsState createState() => _AddonsState();
}

class _AddonsState extends State<Addons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtAddons();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtAddons();
          } 
          else {
            return TabAddons();
          }
        },
      )
      );
}
  
}