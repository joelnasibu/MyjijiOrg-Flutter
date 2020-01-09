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
  TabController _controller;

  @override
  void initState() { 
    super.initState();
    _controller = TabController(vsync:this,length: 3);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("More ... "),
        bottom: TabBar(
          isScrollable:true,
          controller: _controller,
          indicatorColor: AppSecondaryColor,
          labelColor: AppSecondaryColor,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            Tab(
              text: 'Packages',

            ),
             Tab(
              text: 'Tickets',
            ),
           
            Tab(
              text: 'Addons',

            ),


          ],
          
        ),
      ),
      
      body: TabBarView(
        controller: _controller,
        children: <Widget>[         
          Packages(),
          Tickets(),
          Addons()

        ],
      ),
    );

     
  }
}