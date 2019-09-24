import 'package:flutter/material.dart';
import 'package:organizer/models/slideRight.dart';
import 'package:organizer/models/slideleft.dart';
import 'package:organizer/screen/createProfile/company/oCompanyProfile.dart';
import 'package:organizer/screen/createProfile/individual/oIndividualProfile.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/style.dart';

class PrtCreateProfile extends StatefulWidget {
  @override
  _PrtCreateProfileState createState() => _PrtCreateProfileState();
}

class _PrtCreateProfileState extends State<PrtCreateProfile> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 4,
          currentIndex: _selected,
          onTap: (index) {
            setState(() {
              _selected = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(),
              title:
                  Text('Company', style: TextStyle(fontSize: NormalFonteSize)),
            ),
            BottomNavigationBarItem(
                icon: Container(),
                title: Text('Individual',
                    style: TextStyle(fontSize: NormalFonteSize))),
          ],
        ),
        body: selectedProfile(_selected));
  }

  Widget selectedProfile(int index) {
    switch (index) {
      case 0:
        return CompanyProfileScreen();
      case 1:
        return IndividualProfileScreen();
        break;
      default:
        return CompanyProfileScreen();
        break;
    }
  }
}
