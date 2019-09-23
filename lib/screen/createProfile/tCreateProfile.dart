import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/company/oCompanyProfile.dart';
import 'package:organizer/screen/createProfile/individual/oIndividualProfile.dart';
import 'package:organizer/style.dart';

class TabCreateProfile extends StatefulWidget {
  @override
  _TabCreateProfileState createState() => _TabCreateProfileState();
}

class _TabCreateProfileState extends State<TabCreateProfile> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Container(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Update Profile Info',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              color: AppPrimaryDark,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selected,
          onTap: (index) {
            setState(() {
              _selected = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(),
              title: Text('Company'),
            ),
            BottomNavigationBarItem(
                icon: Container(), title: Text('Individual')),
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
