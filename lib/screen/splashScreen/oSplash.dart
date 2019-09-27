import 'package:flutter/material.dart';
import 'package:organizer/screen/splashScreen/pSplash.dart';
import 'package:organizer/screen/splashScreen/tSplash.dart';
import 'package:organizer/screen/splashScreen/txSplash.dart';
import 'package:organizer/style.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtSplash();
          } else if (constraints.maxWidth > WidthDimension && constraints.maxWidth <= TabwidthDimension) {
            return TabSplash();
          } else{
            return TabXSplash();
          }

        },
      ),
    );
  }
}
