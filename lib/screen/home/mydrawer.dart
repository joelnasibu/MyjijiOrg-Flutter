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
              height: 230.0,
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/4.jpg')),
                accountName: Text("Profile Name"),
                accountEmail: Text("Email",style:TextStyle(color: Colors.white)),

              decoration: BoxDecoration(   
                color: AppPrimaryDark,             
              ),
                    
                

              )), 
           
           
           
           
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {                
                Navigator.push(context,MaterialPageRoute(
                  builder: (context)=>DashBoard()
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title:  Text('My Services'),
             
              onTap: () {
                
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              trailing:  Container(
                    padding: const EdgeInsets.all(5.0), 
                    child: Text('10',style: TextStyle(color:Colors.white)),
                    decoration: BoxDecoration(                      
                      color: Colors.blue, 
                      shape: BoxShape.circle                  
                    ),
                    
                  ),
              onTap: () {                
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.pie_chart_outlined),
              title:  Text('Analytics'),
              trailing:  Container(
                    padding: const EdgeInsets.all(5.0), 
                    child: Text('5',style: TextStyle(color:Colors.white)),
                    decoration: BoxDecoration(                      
                      color: Colors.deepOrange[800], 
                      shape: BoxShape.circle                  
                    ),
                    
                  ),
              onTap: () {
                
                Navigator.pop(context);
              },
            ),

          
            Divider(),
            ListTile(leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {                
                Navigator.pop(context);
              },
            ),
            
            ListTile(

              leading: Icon(Icons.info_outline),
              title: Text('about'),
              onTap: () {                
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help'),
              onTap: () {                
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Logout'),
              onTap: () {                
                Navigator.pop(context);
              },
            ),



          ],
        ),
    );
  }
}