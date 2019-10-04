import 'package:flutter/material.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/style.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
         
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
           
            _listTileFormat(context, Icons.dashboard, "Dashboard", 0,DashBoard()),
            _listTileFormat(context, Icons.trending_up, "Recent events", 0,DashBoard()),
            _listTileFormat(context, Icons.high_quality,"Venues", 10,DashBoard()),
            _listTileFormat(context, Icons.card_membership,"Tickets", 0,DashBoard()),

                 
            Divider(),

            _listTileFormat(context, Icons.settings,"Settings", 0, DashBoard()),
            _listTileFormat(context, Icons.info_outline,"About", 0, DashBoard()),
            _listTileFormat(context, Icons.help_outline,"Help", 0, DashBoard()),
            _listTileFormat(context, Icons.power_settings_new,"Logout", 0, DashBoard()),




          ],
        ),
    );
  }


  Widget _listTileFormat(BuildContext context,IconData icon, String title, int trailer,Widget page){
   return  ListTile(
              leading: Icon(icon,color: AppPrimaryDark,),
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
                Navigator.push(context,MaterialPageRoute(
                  builder: (context)=>page
                ));
              },
            );
  }
}