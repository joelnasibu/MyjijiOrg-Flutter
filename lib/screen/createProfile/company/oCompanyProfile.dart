import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/company/pCompanyProfile.dart';
import 'package:organizer/screen/createProfile/company/tCompanyProfile.dart';

class CompanyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600.0) {
            return PrtCompanyProfile();
          } else {
            return TabCompanyProfile();
          }
        },
      ),
    );
  }
}
