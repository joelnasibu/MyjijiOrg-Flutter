import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/screen/Events/oEvents.dart';
import 'package:organizer/screen/dashBoard/oDashboard.dart';
import 'package:organizer/screen/profile/oProfile.dart';
import 'package:organizer/screen/venues/oVenues.dart';
import 'package:organizer/style.dart';

class Home2 extends StatelessWidget {
  DB db = DB();

  Map<int, dynamic> optionCard = {
    0: {"title": "My Wall", "icon": Icons.timeline, "widget": Profile()},
    1: {"title": "Trends", "icon": Icons.trending_up, "widget": Events()},
    2: {"title": "Analytics", "icon": Icons.attach_money, "widget": DashBoard()},
    3: {
      "title": "Social Media",
      "icon": Icons.share,
      "widget": Container(child: Center(child: Text('Coming Soon')))
    },
    4: {"title": "VPMC", "icon": Icons.pin_drop, "widget": Venue()},
    5: {
      "title": "Exhibitions",
      "icon": Icons.view_carousel,
      "widget": Container(child: Center(child: Text('Coming Soon')))
    },
  };

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: AppPrimaryColor,
        
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                expandedHeight: 280.0,
                floating: false,
                pinned: true,
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
                          backgroundImage: AssetImage(
                              "assets/images/display_pictures/sheril.jpg"),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      Text("Profile"),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ])),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('MYJIJI ORGANIZER BOARD',
                      style: boldViewDown.copyWith(
                        fontSize: LargeFontSize,
                        color: Colors.white
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      height: 20,
                      color: Colors.grey[600],
                      indent: orientation==Orientation.portrait?150:250,
                      endIndent: orientation==Orientation.portrait?150:250,
                      
                    )
                  ],
                ),
              )
            ),

            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _cardOption(context, index),
                  childCount: optionCard.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 3 : 4,
                
              ),
            ),
          ],
        ));
  }

  _cardOption(BuildContext context, int i) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => optionCard[i]['widget']));
        },
        child: Card(
          elevation: 2.0,
          color: AppPrimaryDark,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child:Icon(
                  optionCard[i]['icon'],
                  size: 40,
                  color: i%2==0?AppPrimaryLight:AppSecondaryColor,
                  )
                ),
                Text(
                  optionCard[i]['title'].toString().toUpperCase(),
                  style: boldViewDown.copyWith(
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
