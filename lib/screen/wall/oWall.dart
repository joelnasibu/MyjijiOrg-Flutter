import 'package:flutter/material.dart';
import 'package:organizer/screen/profile/tabs/fPage.dart';
import 'package:organizer/screen/profile/tabs/sPage.dart';
import 'package:organizer/screen/wall/pWall.dart';
import 'package:organizer/screen/wall/tWall.dart';
import 'package:organizer/style.dart';


class Wall extends StatefulWidget {
  @override
  _WallState createState() => _WallState();
}

class _WallState extends State<Wall> {
  
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("My Events"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppSecondaryDark,
        selectedLabelStyle: boldViewDown,
        
        currentIndex: _currentIndex,
        onTap: (index){
          setState((){
            _currentIndex = index;
            
          });
        },
        items: [
         _bottomNavItem("Events"),
         _bottomNavItem("Upcoming Event")

        ],
      ),
   
      body: _selectedPage(_currentIndex),
 


    );
  }

  _bottomNavItem(String title){
      return BottomNavigationBarItem(
        icon: Container(),
        title: Text(title)
      );
  }

  _selectedPage(int p){
    switch (p){
      case 0: return FPage();break;
      case 1: return SPage();break;
      default: return FPage();break;

    }
  }
}