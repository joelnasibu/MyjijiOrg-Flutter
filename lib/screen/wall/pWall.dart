import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/screen/profile/tabs/fPage.dart';
import 'package:organizer/screen/profile/tabs/sPage.dart';
import 'package:organizer/screen/profile/tabs/tPage.dart';
import 'package:organizer/style.dart';

class PrtWall extends StatefulWidget {
  @override
  _PrtWallState createState() => _PrtWallState();
}

class _PrtWallState extends State<PrtWall> with TickerProviderStateMixin {
  TabController _tabController;
  int position;
  int _tabIndex = 0;
  DB db = DB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(vsync: this, length: 2);
  }

  goTo() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 280.0,
            floating: false,
            pinned: true,
            bottom: TabBar(
              controller: _tabController,
              labelStyle: boldViewDown,
              indicatorColor: AppSecondaryColor,
              indicatorWeight: 5,
              tabs: <Widget>[
                Tab(text: "Events"),
                Tab(text: "Upcoming Events"),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: AppSecondaryColor,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black, BlendMode.colorDodge)),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage("assets/images/display_pictures/bert.jpg"),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile"),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ])),
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[FPage(), SPage()],
          ),
        )
      ],
    );
  }
}
