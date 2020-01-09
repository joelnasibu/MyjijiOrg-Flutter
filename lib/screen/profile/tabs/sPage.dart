import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';

class SPage extends StatelessWidget {
  DB db = DB();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: db.events.length,
            itemBuilder: (context, index) => _bookingLayout(
                  screenWidth,
                  index,
                )));
  }

  Widget _bookingLayout(double screenWidth, int i) {
    final live = db.events[i]['status'];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {},
        child: live == 1
            ? Container(
                child: Stack(children: [
                  Card(
                      margin: EdgeInsets.fromLTRB(30, 24, 8, 0),
                      color: Colors.white,
                      elevation: 2,
                      child: Container(
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1,color:Colors.grey[300])
                        ),
                        height: 150,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.only(left: 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                db.events[i]['title'],
                                style: boldViewDown,
                              ),
                            ),
                            _iconRowLayout(Icons.bookmark_border, AppSecondaryDark, '${db.events[i]['bookings'].length} Bookings',),
                          //  _iconRowLayout(Icons.favorite_border, Colors.blue[800], '${db.events[i]['likes']} Likes',),

                            _iconRowLayout(Icons.calendar_today, Colors.red[900], "${db.events[i]['start_date']}"),

                            Container(
                              padding: EdgeInsets.only(top:2.0,right: 26.0),
                              child: Text(
                                db.events[i]['description'],
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,

                              ),
                            )
                            
                            
                          ],
                        ),
                      )),
                  Card(
                    elevation: 2.0,
                      child: Container(
                    margin: EdgeInsets.all(2.0),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0)),
                        image: DecorationImage(
                            image: AssetImage(db.events[i]['banner']),
                            fit: BoxFit.cover)),
                  ))
                
                
                
                ]))
            : Container(),
      ),
    );
  }




  _iconRowLayout(IconData icon,Color color,String text){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Text(
                    text,
                    style: TextStyle(
                        fontSize:  SmallFontSize + 3,
                        color: color))),
            Icon(
              icon,
              color: color,
              size: 25,
            ),
           
          ],
        ),
      );
  }
}


