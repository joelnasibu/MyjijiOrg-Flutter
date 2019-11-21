import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PrtDashBoard extends StatefulWidget {
  PrtDashBoardState createState() => PrtDashBoardState();
}

class PrtDashBoardState extends State<PrtDashBoard>
    with TickerProviderStateMixin {
  // List<HomeJson> data = [];
  // HomeJson online = HomeJson();


  String selected = null;
  String selectCat = null;

  DB db = DB();

  List<String> _dropCategory = List<String>();
  double price = 0.0;
  int attendance = 0;

  int imageEventSelected = 0;
  int previousEvent = 0;

  List <charts.Color> barcolors = [
    charts.MaterialPalette.gray.shade400,    //dark Gray
    charts.Color(r:12,g:20,b:59),             //App BLue
    charts.Color(r:255,g:193,b:7),           // Orange
    charts.MaterialPalette.gray.shade400,
    charts.Color(r:12,g:20,b:59),
    charts.Color(r:12,g:20,b:59),
    charts.Color(r:255,g:193,b:7),
    charts.Color(r:12,g:20,b:59),
    charts.Color(r:255,g:193,b:7),
    charts.Color(r:12,g:20,b:59),
  ];


  double totalIncome;


  List<Widget> _builder = List<Widget>();
  static List<EventPop> mydata = [];
  static List<charts.Series<EventPop, String>> createSeries() {

    return [
      charts.Series<EventPop, String>(
        data: mydata,
        id: "Tickets",
        domainFn: (EventPop event, _) => event.attendants.toString(),
        measureFn: (EventPop event, _) => event.tickets,
        colorFn: (EventPop event, __) => event.color,
      )
    ];
  }

@override
  void initState() {
    super.initState();
      price = db.events[0]['price'];
      attendance = db.events[0]['attendance'];
    _dropCategory = db.events[0]['categories'];
    for(var i =0; i<10;i++){
      mydata.add(
        EventPop((i+1), db.events[0]['charts'][i],barcolors[i])
      );
    }
    
  }

  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
   

    _builder.clear();
    for (var i = 0; i < db.events.keys.length; i++) {
      _builder
          .add(_buildCarosel(i, db.events[i]['title'], db.events[i]['rates'], db.events[i]['banner']));
    }

    final section_1 = Container(

      margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
     
      width: screenWidth,
      height: screenHeight * .32,
      child: CarouselSlider(
          enlargeCenterPage: true, 
         // viewportFraction: 0.8,         
          onPageChanged: (curr){
            setState(() {
              imageEventSelected = curr;
               price = db.events[imageEventSelected]['price'];
               attendance = db.events[imageEventSelected]['attendance'];
              _dropCategory = db.events[imageEventSelected]['categories'];
              
              for(var i =0; i<10;i++){
                mydata.add(
                  EventPop((i+1), db.events[imageEventSelected]['charts'][i],barcolors[i])
                );
              }
     


              selectCat = null;
            
            });
            
          },
          autoPlay: false,
          autoPlayAnimationDuration: Duration(seconds: 10),
          items: _builder
          ),
    );

    final section_2 = Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),

      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            elevation: 2,
            child: Container(
              width: (screenWidth - 48)/3 ,
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child:  DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Category',
                        hintStyle: TextStyle(fontSize: TinyFontSize,),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),

                      value: selectCat,
                      items: _dropCategory
                          .map((val) => DropdownMenuItem(
                              child: Text(
                                val,
                                style: boldView,
                              ),
                              value: val))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectCat = val;
                        });
                      },


                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      selectCat!=null?selectCat:'-',
                      style: boldViewDown.copyWith(fontSize: SmallFontSize),
                    ),
                  )
                  ]))
            
                  ),
               
          Card(
            elevation: 2.0,
            child: Container(
              width: (screenWidth - 48) / 3,            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Attendance",
                    style: boldView,
                  ),
                  Text(
                    "$attendance",
                    style: boldViewDown,
                  )
                ],
              ),
            ),
          ),
          
          Card(
            elevation: 2.0,
            child: Container(
              width: (screenWidth - 48) / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Ticket Rate",
                    style: boldView,
                  ),
                  Text(
                    "\$ $price",
                    style: boldViewDown,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    final section_3 = Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child:Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: charts.BarChart(
        createSeries(),
        animate: true,
      ),
    ));

    final section_4 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(            
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
            child: Text('Statistics', style: boldView.merge(boldViewDown))),
          Card(
            elevation: 14,
            margin: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 3, color: AppPrimaryColor)),
                        width: 90,
                        height: 90,
                        child: Center(
                            child: Text(
                          "46%",
                          style: boldViewDown.copyWith(color: AppPrimaryColor),
                        )),
                      ),
                      Text(
                        "Platinum",
                        style: boldViewDown.copyWith(color: AppPrimaryColor),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 3, color: AppSecondaryColor)),
                        width: 90,
                        height: 90,
                        child: Center(
                            child: Text(
                          "54%",
                          style: boldViewDown.copyWith(color: AppSecondaryColor),
                        )),
                      ),
                      Text(
                        "Gold",
                        style: boldViewDown.apply(color: AppSecondaryColor),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border:
                                Border.all(width: 3, color: Colors.grey[500])),
                        width: 90,
                        height: 90,
                        child: Center(
                            child: Text(
                          "100%",
                          style: boldViewDown.copyWith(color: Colors.grey[500]),
                        )),
                      ),
                      Text(
                        "Total",
                        style: boldViewDown.apply(color: Colors.grey[500]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    final section_5 = Container(
      decoration: BoxDecoration(
          color: AppPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35.0))),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 24),
      // margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Icon(Icons.attach_money, size: 40, color: AppPrimaryColor)),
        title: Text('Total Income',
            style: boldViewDown.copyWith(color: Colors.white)),
        trailing: Text("\$ 69,489",
            style: boldViewDown.copyWith(
                fontSize: ExtraLargeSize, color: AppSecondaryColor)),
      ),
    );

    return ListView(
        children: [
          section_1,
          section_2, 
          section_3, 
          section_4, 
          section_5
        ]);
  }

  Widget _buildCarosel(
      int position, String title, double rate, String imagepath) {
    int less = rate.floor();
    double actual = rate - less;

    List<Widget> stars = List<Widget>();
    stars.clear();
    for (var k = 0; k < 5; k++) {
      if (less <= 5 && less > 0) {
        stars.add(Icon(Icons.star, color: Colors.yellow));
      } else if (less == 0 && actual > 0) {
        stars.add(Icon(Icons.star_half, color: Colors.yellow));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.yellow));
      }
      less--;
    }

    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppPrimaryColor,
          image: DecorationImage(
              image: AssetImage(imagepath), fit: BoxFit.cover)),
      child: Stack(
        children:[
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.6),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8)
                )
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: Colors.white, fontSize: NormalFonteSize)),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end, children: stars),
                  )
                ],
              ),
            ),
          ),
        ])
    );
  }
}

class EventPop {
  int tickets;
  int attendants;
  charts.Color color;

  EventPop(this.attendants, this.tickets, this.color);
}
