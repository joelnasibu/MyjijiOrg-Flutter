import 'package:flutter/material.dart';
import 'package:organizer/screen/Alert/oAlert.dart';
import 'package:organizer/screen/Events/oEvents.dart';
import 'package:organizer/screen/SetCategories/setCategories.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/screen/tickets/oTickets.dart';
import 'package:organizer/screen/venues/oVenues.dart';
import 'package:organizer/style.dart';

class Homepage extends StatefulWidget {

  @override
  HomepageState createState() => HomepageState();

}

class HomepageState extends State <Homepage>{
 int _selectedIndex = 0;

 
  Widget selectedPage(int option){
    switch(option){
      case 0: return DashBoard();
        break;
      case 1: return Venue();
        break;
      case 2: return Alert();
        break;
      case 3: return SetCategories();
        break;
      case 4:return SetCategories();
        break;
      case 5:return Events();
        break;
      case 6:return DashBoard();
        break;
      case 7:return SetCategories();
        break;
      default: return DashBoard();                     
        break;
                }             
    
  }

  void clicked(int index){
    setState(() {
     _selectedIndex = index; 
    });
    Navigator.pop(context); 
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: selectedPage(_selectedIndex),
      drawer: Drawer(
          child: ListView(            
              children: <Widget> [
                Container(
                  height: 200.0,
                  child: UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/display_pictures/sheril.jpg')),
                      //NetworkImage('https://randomuser.me/api/portraits/men/4.jpg')),
                    accountName: Text("Profile Name"),
                    accountEmail: Text("Email",style:TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(   
                    color: AppPrimaryColor,             
                  ),
                    
                  )), 
              
                               
               

                _listTileFormat(context, Icons.trending_up,"Latest Event", 0, 5),
                _listTileFormat(context, Icons.settings,"Settings", 0, 4),
                _listTileFormat(context, Icons.info_outline,"About", 0, 5),
                _listTileFormat(context, Icons.help_outline,"Help", 0, 6),
                _listTileFormat(context, Icons.power_settings_new,"Logout", 0, 7),




              ],
            ),
        ),      
    
      
 bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPrimaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        showUnselectedLabels: false,
       // shape: CircularNotchedRectangle(), 

       onTap: (index){
         setState(() {
          _selectedIndex = index; 

         });
       },

        items :[

            _listBottomFormat(Icons.dashboard, "Dashboard"),            
            _listBottomFormat(Icons.pin_drop, "Venue"),           
            _listBottomFormat(Icons.notifications, "Alert"),          
            _listBottomFormat(Icons.person, "Account"),               
            _listBottomFormat(Icons.more_vert, "More"),               

        ]
      
      ),      
         

    
    );
  }

   _listBottomFormat(IconData icon, String title){      
      return BottomNavigationBarItem(        
        title:Text(title,style:TextStyle(fontSize:TinyFontSize)),
        icon: Icon(icon,size: 20,),
      );
  }

  Widget _listTileFormat(BuildContext context,IconData icon, String title, int trailer, int page){
   return  ListTile(
              leading: Icon(icon,color: AppSecondaryColor ,),
              title: Text(title),
              trailing:  trailer != 0 ? Container(
                    padding: const EdgeInsets.all(5.0), 
                    child: Text(trailer.toString(),style: TextStyle(color:Colors.white)),
                    decoration: BoxDecoration(                       
                      color: Colors.deepOrange[800], 
                      shape: BoxShape.circle                  
                    ),                    
                  ): null,

              onTap: () {
                clicked(page);
              }
            );
  }
}


