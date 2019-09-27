import 'package:flutter/material.dart';
import 'package:organizer/screen/home/mydrawer.dart';
import 'package:organizer/screen/home/pHomepage.dart';
import 'package:organizer/screen/home/tHomepage.dart';
import 'package:organizer/style.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot Event'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtHomepage();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtHomepage();
          } 
          else {
            return TabHomepage();
          }
        },
      ),
    );
  }
}
