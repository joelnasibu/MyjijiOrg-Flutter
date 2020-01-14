import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organizer/screen/wall/wallEvent.dart';
import 'package:organizer/screen/wall/wallPartners.dart';
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
        title:Text("My Wall"),
      ),
      backgroundColor: Colors.grey[100],
      
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
         _bottomNavItem(Icons.event,"Events"),
         _bottomNavItem(FontAwesomeIcons.networkWired,"My Network")

        ],
      ),
   
      body: _selectedPage(_currentIndex)
 


    );
  }

  _bottomNavItem(IconData icon,String title){
      return BottomNavigationBarItem(
        icon: Icon(icon),
        title: Text(title)
      );
  }

  _selectedPage(int p){
    switch (p){
      case 0: return WallEvent();break;
      case 1: return WallPartners();break;
      default: return WallEvent();break;

    }
  }
}