import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PrtDashBoard extends StatefulWidget {
  PrtDashBoardState createState() => PrtDashBoardState();
}

class PrtDashBoardState extends State<PrtDashBoard>
    with TickerProviderStateMixin {
  // List<HomeJson> data = [];
  // HomeJson online = HomeJson();

  List<String> products = [
    'http://www.kustomclubs.com/wp-content/uploads/2019/07/IMG_2851-1024x575.jpg',
    'https://www.feelgoodevents.com.au/wp-content/uploads/2017/02/10933957_908820615818063_6504247213800313682_n-960x600.jpg',
    'https://image.cnbcfm.com/api/v1/image/105462444-1537465508117echo-dot-new.jpeg?v=1537465880&w=678&h=381',
    'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    'https://dominicanexpert.com/wp-content/uploads/2016/06/fondo-2.jpg',
    'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    'https://imgcld.yatra.com/ytimages/image/upload/t_seo_Holidays_w_640_h_480_c_fill_g_auto_q_auto:good_f_jpg/v1449657155/Kenya108.jpg',
    'https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg'
  ];
  String selected = null;
  String selectCat = null;

  Map<int, dynamic> db = {
    0: {
      'description': "Nairobi Event",
      'banner': "assets/images/banners/Aquablu.jpg",
      'categories': ["category 1", 'category 2', 'Category 3'],
      'rates': 3.5,
      'charts': [200, 130, 310, 302, 200, 320, 350, 150, 50, 250],
      'attendance': 3489,
      'price': 20.0,
    },
    1: {
      'description': "Machakos Sport",
      'banner': "assets/images/banners/AquaBlue.jpg",
      'categories': ["category 1", 'category 2', 'Category 3'],
      'rates': 3.0,
      'charts': [200, 130, 510, 300, 210, 320, 150, 150, 50, 50],
      'attendance': 489,
      'price': 35.0,
    },
    2: {
      'description': "Miss Kenya World",
      'banner': "assets/images/banners/blue.jpg",
      'categories': ["category 1", 'category 2'],
      'rates': 4.5,
      'charts': [100, 230, 110, 402, 200, 420, 150, 250, 150, 50],
      'attendance': 1289,
      'price': 10.0,
    },
    3: {
      'description': "Super League",
      'banner': "assets/images/banners/gogo-simo-artwork-2.jpg",
      'categories': ["category 1", 'category 2', 'Category 3', 'Category 4'],
      'rates': 5.0,
      'charts': [47, 180, 420, 350, 213, 32, 460, 150, 50, 250],
      'attendance': 348,
      'price': 25.0,
    },
    4: {
      'description': "Beach Boy",
      'banner': "assets/images/banners/yoga event.jpg",
      'categories': ["category 1"],
      'rates': 4.0,
      'charts': [250, 390, 110, 240, 500, 120, 450, 350, 250, 45],
      'attendance': 2807,
      'price': 72.0,
    },
  };



  List<String> _dropCategory = List<String>();
  double price = 0.0;
  int attendance = 0;

  int imageEventSelected = 0;
  int previousEvent = 0;

  List <charts.Color> barcolors = [
    charts.MaterialPalette.black,
    charts.MaterialPalette.deepOrange.shadeDefault,
    charts.MaterialPalette.deepOrange.shadeDefault,
    charts.MaterialPalette.black,
    charts.MaterialPalette.black,
    charts.MaterialPalette.green.shadeDefault,
    charts.MaterialPalette.deepOrange.shadeDefault,
    charts.MaterialPalette.green.shadeDefault,
    charts.MaterialPalette.deepOrange.shadeDefault,
    charts.MaterialPalette.green.shadeDefault,
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
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    _builder.clear();
    for (var i = 0; i < db.keys.length; i++) {
      _builder
          .add(_buildCarosel(i, db[i]['description'], db[i]['rates'], db[i]['banner']));
    }

    final section_1 = Container(

      margin: EdgeInsets.fromLTRB(2, 2, 2, 4),
     
      width: screenWidth,
      height: screenHeight * .32,
      child: Carousel(
          
          onImageChange: (prev,curr){
            setState(() {
              imageEventSelected = curr;
              previousEvent = prev;

               price = db[imageEventSelected]['price'];
               attendance = db[imageEventSelected]['attendance'];

              _dropCategory = db[imageEventSelected]['categories'];

              
              for(var i =0; i<10;i++){
                mydata.add(
                  EventPop((i+1), db[imageEventSelected]['charts'][i],barcolors[i])
                );
              }
     


              selectCat = null;
            
            });
            
          },
          autoplay: false,
          autoplayDuration: Duration(seconds: 10),
          dotSize: 4,
          dotColor: Colors.black26,
          dotIncreasedColor: Colors.black26,
          indicatorBgPadding: 5.0,
          dotSpacing: 10,
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.topCenter,
          images: _builder),
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
                        hintStyle: TextStyle(fontSize: TinyFontSize),
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
            margin: EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 3, color: Colors.black)),
                        width: 90,
                        height: 90,
                        child: Center(
                            child: Text(
                          "46%",
                          style: boldViewDown,
                        )),
                      ),
                      Text(
                        "Platinum",
                        style: boldViewDown,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 3, color: Colors.orange)),
                        width: 90,
                        height: 90,
                        child: Center(
                            child: Text(
                          "54%",
                          style: boldViewDown,
                        )),
                      ),
                      Text(
                        "Gold",
                        style: boldViewDown.apply(color: Colors.orange),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border:
                                Border.all(width: 3, color: Colors.grey[400])),
                        width: 90,
                        height: 90,
                        child: Center(
                            child: Text(
                          "100%",
                          style: boldViewDown,
                        )),
                      ),
                      Text(
                        "Total",
                        style: boldViewDown.apply(color: Colors.grey[400]),
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
                fontSize: ExtraLargeSize, color: Colors.yellow)),
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
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppPrimaryColor,
          image: DecorationImage(
              image: AssetImage(imagepath), fit: BoxFit.cover)),
      child: Stack(
        children:[
          Align(
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      setState(() {
                         
                      });
                    }
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){

                    },
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.6),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
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
