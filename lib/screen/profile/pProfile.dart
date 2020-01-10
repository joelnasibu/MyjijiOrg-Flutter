import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/models/user.dart';
import 'package:organizer/screen/profile/tabs/fPage.dart';
import 'package:organizer/screen/profile/tabs/sPage.dart';
import 'package:organizer/screen/profile/tabs/tPage.dart';
import 'package:organizer/style.dart';



class PrtProfile extends StatefulWidget {
  
  @override
  _PrtProfileState createState() => _PrtProfileState();
}

class _PrtProfileState extends State<PrtProfile> with TickerProviderStateMixin {

TabController _tabController;
int position;
int _tabIndex = 0;
DB db = DB();
int id = User().getUser();


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(vsync: this,length: 2);
  }
   
  goTo(){
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);

  }



  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
            slivers: <Widget>[
               SliverAppBar(
              leading: Container(
                padding: EdgeInsets.only(left: 16),
                height: 50,
                child: InkWell(
                  child: Image.asset(AppLogo),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                   // Scaffold.of(context).openDrawer();
                  },
                ),
              ],
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: AppPrimaryColor,
                        // image: DecorationImage(
                        //   image: NetworkImage("https://image.freepik.com/free-photo/abstract-background-with-low-poly-design_1048-8478.jpg"),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          //color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                    
                    Center(
                      child: Container(                      
                        padding: EdgeInsets.only(top: 30),
                        // alignment: Alignment.bottomLeft,
                        child: Text(
                          db.organizers[id]['name'],
                          style: boldViewDown.copyWith(
                              color: Colors.white, fontSize: ExtraLargeSize),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              centerTitle: true,
              title: Text(
                "MY PROFILE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SliverToBoxAdapter(
              child: Stack(
                children:[
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppPrimaryColor,
                      border: Border(
                        left: BorderSide(width: 0),
                      ),

                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(250, 80),
                        bottomRight: Radius.elliptical(250, 80)
                      ),
                    ),
                  ),

                  Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage(db.organizers[id]['profile']),
                      ),
                    ),

                ]),
            ),
              
            
              
              SliverFillRemaining(
                
                  child: Container(
                    decoration: BoxDecoration(
                      
                     
                    ),
                    child: Text("Test"),
                  ),
              
              
               )
                
                 
              
              
              ],


              
    );
  }
}
