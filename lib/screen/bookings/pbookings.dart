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
int position;
int _tabIndex = 0;



@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(vsync: this,length: 3);
  }
   
  goTo(){
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: PreferredSize(
            preferredSize:Size.fromHeight(70),
            
            child:Card(
              margin: EdgeInsets.symmetric(vertical: 12.0),   
              elevation: 1.0,               
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2.0),

              child:TabBar(
                                
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[900],

                ),

                labelColor: Colors.white,
               // labelStyle: boldViewDown,  
                controller: _tabController,
                unselectedLabelColor: Colors.red[900],
            tabs: <Widget>[
              _tabContainer('Events'),
              _tabContainer('Bookings'),
              _tabContainer('Overview'),
             
            ],
            onTap: (index){

            }, 
          )))),

         body: Container( 
             height: MediaQuery.of(context).size.height,
             child: TabBarView(
              
             controller: _tabController,
             children: <Widget>[
               FPage(),
               SPage(),
               TPage(),
             ],
           ),
           )
          );   

  }
 
 

  _tabContainer(String title){
    return Tab(
          text:title,
          
      );
   
  }
}