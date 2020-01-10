import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/models/slideUp.dart';
import 'package:organizer/models/user.dart';
import 'package:organizer/screen/Alert/oAlert.dart';
import 'package:organizer/screen/Events/oEvents.dart';
import 'package:organizer/screen/SetCategories/setCategories.dart';
import 'package:organizer/screen/chats/oChats.dart';
import 'package:organizer/screen/createEvent/oCreateEvent.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/screen/home/pHomepage.dart';
import 'package:organizer/screen/home/tHomepage.dart';
import 'package:organizer/screen/profile/oProfile.dart';
import 'package:organizer/screen/venues/oVenues.dart';
import 'package:organizer/style.dart';

class Homepage extends StatefulWidget {

  @override
  HomepageState createState() => HomepageState();

}

class HomepageState extends State <Homepage>{
 int _selectedIndex = 0;
 int id  = User().getUser();
 DB db =  DB();

 
  Widget selectedPage(int option){
    switch(option){
      case 0: return Home();
        break;
      case 1: return Chats();
        break;
      case 2: return Alert();
        break;
      case 3: return Profile();
        break;
      case 4:return SetCategories();
        break;
      case 5:return Venue();
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
      floatingActionButton: FloatingActionButton.extended(

        icon:Icon(Icons.add_circle,color: Colors.black),
        label:Text("Create Event",style: boldViewDown.copyWith(color: Colors.black)),

        onPressed: (){
          Route route = SlideUp(
            widget: CreateEvent(),
            time: 400,
          );
          Navigator.push(context, route);

        },
      
        
      ),
      body: selectedPage(_selectedIndex),
      drawer: Drawer(
          child: ListView(            
              children: <Widget> [
                Container(
                  height: 200.0,
                  child: UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(db.organizers[id]['profile'])),
                    accountName: Text(db.organizers[id]['name']),
                    accountEmail: Text(db.organizers[id]['email'],style:TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(   
                    color: AppPrimaryColor,             
                  ),
                    
                  )), 
              
                               
               

                _listTileFormat(context, Icons.pin_drop,"Venues", 0, 5),
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

            _listBottomFormat(Icons.home, "Dashboard"),            
            _listBottomFormat(Icons.question_answer, "Feedback"),      
            _listBottomFormat(Icons.notifications, "Alert"),          
            _listBottomFormat(Icons.person, "Profile"),               
            _listBottomFormat(Icons.more_vert, "More"),               

        ]
      
      ),      
         

    
    );
  }

   _listBottomFormat(IconData icon, String title){      
      return BottomNavigationBarItem(        
        title:Text(title,style:TextStyle(fontSize:SmallFontSize)),
        icon: Icon(icon,size: 20,),
      );
  }

  Widget _listTileFormat(BuildContext context,IconData icon, String title, int trailer, int page){
   return  Column(
     children:[
       ListTile(
     
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
       ),
       Divider()
     ]);
  }
}


