import 'package:flutter/material.dart';
import 'package:organizer/screen/home/oHomepage.dart' as home;
import 'package:organizer/style.dart';

class MyDrawer extends StatefulWidget {

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer>{
  
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
                color: AppPrimaryColor,             
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
    );
  }


  Widget _listTileFormat(BuildContext context,IconData icon, String title, int trailer, int page){
   return  ListTile(
              leading: Icon(icon,color: AppPrimaryColor,),
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
                home.HomepageState().clicked(page);
                print (page);
              }
            );
  }
}