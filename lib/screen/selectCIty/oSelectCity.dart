import 'package:flutter/material.dart';
import 'package:organizer/screen/selectCIty/pSelectCity.dart';
import 'package:organizer/screen/selectCIty/tSelectCity.dart';
import 'package:organizer/style.dart';

class SelectCityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtSelectCity();
          } else {
            return TabSelectCity();
          }
        },
      ),
    );
  }
}
