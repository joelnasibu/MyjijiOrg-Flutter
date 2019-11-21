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

    print("index $_tabIndex");

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: PreferredSize(
            preferredSize:Size.fromHeight(70),
            
            child:Container(
              child:TabBar(
               // labelColor: Colors.black,
               // labelStyle: boldViewDown,
                indicatorColor: Colors.red[900],  
                labelPadding: EdgeInsets.zero,         
                controller: _tabController,
                unselectedLabelColor: Colors.red,
            tabs: <Widget>[
              _tabContainer('Events'),
              _tabContainer('Bookings'),
              _tabContainer('Overview'),
            ],
            onTap: (index){

            }, 
          ))),

         body: Container( 
             height: MediaQuery.of(context).size.height,
             child: TabBarView(
              
             controller: _tabController,
             children: <Widget>[
               FPage(goTo:goTo()),
               SPage(position:null),
               TPage(),
             ],
           ),
           )
          );   

  }
 
 

  _tabContainer(String title){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 8.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ),
      
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Tab(
          text:title
        )
      ));
   
  }
}