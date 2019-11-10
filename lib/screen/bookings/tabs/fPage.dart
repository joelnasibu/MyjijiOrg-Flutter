import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';

class FPage extends StatelessWidget {
  DB db = DB();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 16, 70),
        color: Colors.grey[100],
        child: CustomScrollView(slivers: [
          SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _bookingLayout(context, index);
                },
                childCount: db.events.length,
              ))
        ]));
  }

  _bookingLayout(BuildContext context, int i) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
            msg: '${db.events[i]['title']}\n Coming Soon',
            toastLength: Toast.LENGTH_SHORT,
          );
        },
        child: Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0)),
                      image: DecorationImage(
                          image: AssetImage(db.events[i]['banner']),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text(db.events[i]['title']),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.bookmark, color: AppPrimaryColor, size: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('${db.events[i]['bookings'].length} Bookings',
                          style: TextStyle(
                              color: AppPrimaryColor, fontSize: TinyFontSize)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.blue[800],
                      size: 20,
                    ),
                    Container(
                        width: 100,
                        child: Text('${db.events[i]['likes']} Following',
                            style: TextStyle(
                                fontSize: TinyFontSize,
                                color: Colors.blue[800]))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
