import 'package:flutter/material.dart';
import 'package:organizer/models/slideRight.dart';
import 'package:organizer/models/slideleft.dart';
import 'package:organizer/screen/createProfile/company/oCompanyProfile.dart';
import 'package:organizer/screen/createProfile/individual/oIndividualProfile.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/style.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen>{
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
          style: TextStyle(fontSize: SmallFontSize,color: Colors.black),
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
            onPressed: () {
              Route route  = SlideLeft(
                widget: DashBoard(),
              );
              Navigator.push(context, route);
            },
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
        onTap: (index){
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
      body: selectedProfile(_selected),
    );
 }

  Widget selectedProfile(int i) {
    
    switch (i) {
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
