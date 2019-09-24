import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/company/oCompanyProfile.dart';
import 'package:organizer/screen/createProfile/individual/oIndividualProfile.dart';
import 'package:organizer/style.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen>{
  @override
  Widget build(BuildContext context) {
    int _selected = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Update Profile Info',          
          style: TextStyle(fontSize: NormalFonteSize,color: Colors.black),
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
        backgroundColor: Colors.white,
        elevation: 4,
        currentIndex: _selected,
        onTap: (index) {
          setState(() {
            _selected = index;
            print (_selected);
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
