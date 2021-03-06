import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/company/pCompanyProfile.dart';
import 'package:organizer/screen/createProfile/company/tCompanyProfile.dart';
import 'package:organizer/style.dart';

class CompanyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
        backgroundColor: Colors.grey[200],       
        body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= WidthDimension) {
            return PrtCompanyProfile();
          } else if (constraints.maxWidth >TabwidthDimension){
            return PrtCompanyProfile();
          } 
          else {
            return TabCompanyProfile();
          }
        },
      ),
    );
  }
}
