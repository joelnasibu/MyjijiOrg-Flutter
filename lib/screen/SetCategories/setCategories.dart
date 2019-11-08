import 'package:flutter/material.dart';
import 'package:organizer/screen/Addons/view/oAddons.dart';
import 'package:organizer/screen/bookings/obookings.dart';
import 'package:organizer/screen/packages/oPackages.dart';
import 'package:organizer/screen/tickets/oTickets.dart';
import 'package:organizer/style.dart';

class SetCategories extends StatefulWidget {
  @override
  SetCategoriesState createState() => SetCategoriesState();

}

class SetCategoriesState extends State<SetCategories> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() { 
    super.initState();
    _controller = TabController(vsync:this,length: 4);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("More ... "),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Text('Tickets'),
            ),
            Container(
              child: Text('Packages'),

            ),
            Container(
              child: Text('Bookings'),

            ),
            Container(
              child: Text('Addons'),

            ),


          ],
          
        ),
      ),
      
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Tickets(),
          Packages(),
          Bookings(),
          Addons()

        ],
      ),
    );

     
  }
}