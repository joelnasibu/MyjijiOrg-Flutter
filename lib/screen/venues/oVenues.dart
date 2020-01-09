import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/models/slideRight.dart';
import 'package:organizer/models/slideleft.dart';
import 'package:organizer/screen/venues/lVenues.dart';
import 'package:organizer/style.dart';

class Venue extends StatefulWidget {
  @override
  _VenueState createState() => _VenueState();
}

class _VenueState extends State<Venue> {
  String cat;
  DB db = DB();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Event Categories'),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3
                ),
          itemCount: db.venues.length,
          itemBuilder: (context, index) => listBuilder(context, index)),
    );
  }

  Widget listBuilder(BuildContext context, int index) {
    List<String> converted = db.venues.keys.toList();
    String category = converted[index];

    return InkWell(
      onTap: () {
        Route route = SlideLeft(widget: LVenue(category: category), time: 800);
        Navigator.push(context, route);
      },
      child: Card(
          elevation: 2.0,
          color: Colors.white,//grey[600].withOpacity(.4),
         // margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppPrimaryColor,
                image: DecorationImage(
                    image: NetworkImage(db.venues[category]["banner"]),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white, //black.withOpacity(.6),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  // padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 8.0),
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppSecondaryColor,
                      child: Text(
                        '${index + 1}',
                        style: boldViewDown,
                      ),
                    ),
                    title: Text(category,
                        style:
                            boldViewDown.copyWith(fontSize: NormalFonteSize)),
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
