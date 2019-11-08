import 'package:flutter/material.dart';
import 'package:organizer/screen/bookings/tabs/fPage.dart';
import 'package:organizer/screen/bookings/tabs/sPage.dart';
import 'package:organizer/screen/bookings/tabs/tPage.dart';
import 'package:organizer/style.dart';



class PrtBookings extends StatefulWidget {
  @override
  _PrtBookingsState createState() => _PrtBookingsState();
}

class _PrtBookingsState extends State<PrtBookings> with TickerProviderStateMixin {

TabController _tabController;



@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(vsync: this,length: 3);
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers:<Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black12,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg',fit: BoxFit.cover),
              
            ),
          title: Text("Bookings"),
          bottom: TabBar(
            indicatorColor: AppAccentColor,
            
            controller: _tabController,
            tabs: <Widget>[
              Text('Events'),
              Text("Bookings"),
              Text('Overview')
            ],
            onTap: (index){

            },            
            ),
          ),

          SliverToBoxAdapter(
          
           child: Container( 
             height: MediaQuery.of(context).size.height -200,
             child: TabBarView(
          
             controller: _tabController,
             children: <Widget>[
               FPage(),
               SPage(),
               TPage()
             ],
           ),
           )
          ),

         

         
         
        ]);     

  }
}