import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/models/slideUp.dart';
import 'package:organizer/models/user.dart';
import 'package:organizer/screen/Events/oEvents.dart';
import 'package:organizer/screen/analytics/oAnalytics.dart';
import 'package:organizer/screen/card/oCard.dart';
import 'package:organizer/screen/createEvent/oCreateEvent.dart';
import 'package:organizer/screen/venues/oVenues.dart';
import 'package:organizer/screen/wall/oWall.dart';
import 'package:organizer/style.dart';

class Home extends StatelessWidget {
  DB db = DB();
  int id = User().getUser();

  Map<int, dynamic> optionCard = {
    0: {"title": "My Wall", "icon": Icons.dashboard, "widget": Wall()},
    2: {"title": "Trends", "icon": FontAwesomeIcons.fire, "widget": Events()},
    1: {
      "title": "Analytics",
      "icon": FontAwesomeIcons.chartBar,
      "widget": Analytics()
    },
    3: {
      "title": "Payment Mode",
      "icon": Icons.credit_card,
      "widget": Cards()
    },
    4: {"title": "Partner Up", "icon": FontAwesomeIcons.handshake,"widget": Venue()},
    5: {
      "title": "Ticketing",
      "icon": FontAwesomeIcons.qrcode,
      "widget": Scaffold(body:Container(child: Center(child: Text('Coming Soon'))))
    },
  };

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon:Icon(Icons.add_circle,color: Colors.black),
          label:Text("Create Event",style: boldViewDown.copyWith(color: Colors.black)),

          onPressed: (){
            Route route = SlideUp(
              widget: CreateEvent(),
              time: 400,
            );
            Navigator.push(context, route);

          },
      ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Container(
                padding: EdgeInsets.only(left: 16),
                height: 50,
                child: InkWell(
                  child: Image.asset(AppLogo,color: AppSecondaryColor),
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
              expandedHeight: 320.0,
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
                          image: AssetImage(db.organizers[id]['profile']),
                          fit: BoxFit.cover,
                        ),
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
                            AssetImage(db.organizers[id]['profile']),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 16),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        db.organizers[id]['name'],
                        style: boldViewDown.copyWith( color: Colors.white,
                            fontSize: LargeFontSize),
                      ),
                    )
                  ],
                ),
              ),
              centerTitle: true,
              title: Text(
                "Myjiji Organizer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.topRight,
                     end: Alignment.bottomLeft,
                     colors: [Colors.black,Colors.grey,Colors.black]
                   ),

                 ),
              padding: EdgeInsets.symmetric(vertical: 16),
              margin: EdgeInsets.only(bottom: 20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'DASHBOARD',
                    style: boldViewDown.copyWith(color:Colors.grey[300],fontSize: NormalFontSize),
                  ),
                  Divider(
                    thickness: 5,
                    height: 20,
                    color: Colors.grey[600],
                    indent: orientation == Orientation.portrait ? 150 : 250,
                    endIndent: orientation == Orientation.portrait ? 150 : 250,
                  )
                ],
              ),
            )),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _cardOption(context, index),
                  childCount: optionCard.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 3 : 4,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3),
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
        child: Material(
          elevation: 0.5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2)
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    radius: 28,
                    backgroundColor:
                        i % 2 == 0 ? AppPrimaryColor : AppSecondaryColor,
                    child: Center(child:Icon(
                      optionCard[i]['icon'],
                      size: 25,
                      color: Colors.white
                    ))),
                Text(
                  optionCard[i]['title'],
                  style: TextStyle(fontSize:SmallFontSize)
                )
              ],
            ),
          ),
        ));
  }
}
