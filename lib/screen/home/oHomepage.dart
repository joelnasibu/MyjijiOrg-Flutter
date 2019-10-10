import 'package:flutter/material.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/screen/tickets/oTickets.dart';
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
      case 1: return DashBoard();
        break;
      case 2: return DashBoard();
        break;
      case 3: return Tickets();
        break;
      case 4:return DashBoard();
        break;
      case 5:return DashBoard();
        break;
      case 6:return DashBoard();
        break;
      case 7:return DashBoard();
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
                      backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/4.jpg')),
                    accountName: Text("Profile Name"),
                    accountEmail: Text("Email",style:TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(   
                    color: AppPrimaryDark,             
                  ),
                    
                  )), 
              
                _listTileFormat(context, Icons.dashboard, "Dashboard", 0,0),
                _listTileFormat(context, Icons.trending_up, "Recent events", 0,1),
                _listTileFormat(context, Icons.high_quality,"Venues", 10,2),
                _listTileFormat(context, Icons.card_membership,"Tickets", 0,3),

                    
                Divider(),

                _listTileFormat(context, Icons.settings,"Settings", 0, 4),
                _listTileFormat(context, Icons.info_outline,"About", 0, 5),
                _listTileFormat(context, Icons.help_outline,"Help", 0, 6),
                _listTileFormat(context, Icons.power_settings_new,"Logout", 0, 7),




              ],
            ),
        ),      
    );
  }

  Widget _listTileFormat(BuildContext context,IconData icon, String title, int trailer, int page){
   return  ListTile(
              leading: Icon(icon,color: AppPrimaryDark ,),
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
                print (page);
              }
            );
  }
}
