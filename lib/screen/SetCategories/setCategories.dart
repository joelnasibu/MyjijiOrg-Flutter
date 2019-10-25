import 'package:flutter/material.dart';
import 'package:organizer/screen/Addons/view/oAddons.dart';
import 'package:organizer/screen/packages/oPackages.dart';
import 'package:organizer/screen/tickets/oTickets.dart';
import 'package:organizer/style.dart';

class SetCategories extends StatefulWidget {
  @override
  SetCategoriesState createState() => SetCategoriesState();

}

class SetCategoriesState extends State<SetCategories> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animate;
  
  String bottomTitle = "";
  int _currentIndex = 0;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _animate = Tween(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller,curve:Curves.fastOutSlowIn));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPrimaryDark,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, 
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
       // shape: CircularNotchedRectangle(), 

       onTap: (index){
         setState(() {
          _currentIndex = index; 

         });
       },

        items :[

            _listBottomFormat(Icons.attach_money, "Tickets"),            
            _listBottomFormat(Icons.open_in_browser, "Packages"),            
            _listBottomFormat(Icons.category, "Addons"),            
            _listBottomFormat(Icons.more_vert, "More"),            

        ]
      
      ),      
         
     
      body: _selectedPage(_currentIndex)
  );
  }

  Widget _selectedPage(int option){
    switch(option){
      case 0: return Tickets();
        break;
      case 1: return Packages();
        break;
      case 2: return Addons();
        break;
      case 3: return Center(child: Text("More Settings"));
        break;
      default: return Tickets();
        break;
    }
  }

  
 _listBottomFormat(IconData icon, String title){      
      return BottomNavigationBarItem(        
        title:Text(title,style:TextStyle(fontSize:TinyFontSize)),
        icon: Icon(icon),
      );
  }


}

         