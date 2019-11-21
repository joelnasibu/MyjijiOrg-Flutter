import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';

class LVenue extends StatefulWidget {
   String category;

  LVenue({this.category});
  @override
  _LVenueState createState() => _LVenueState();
  
  
}

class _LVenueState extends State<LVenue> {
  DB db = DB();
  String title;
  @override
  void initState() { 
    super.initState();
   
  }


  @override
  Widget build(BuildContext context) {
    title = widget.category;
    
    return Scaffold(
     
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            iconSize: 30,
            onPressed: (){

            },
          )
        ],
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: db.venues[title].length,
          itemBuilder: (context, index) => listBuilder(context, index)),
    );
  }
    

  Widget listBuilder(BuildContext context, int index) {
     final details = db.venues[title]['details'][index];

    return Card(
        elevation: 4.0,
        color: Colors.grey[600].withOpacity(.4),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppPrimaryColor,
                image: DecorationImage(
                    image: NetworkImage(details["picture"]), fit: BoxFit.cover)),
            child: Stack(children: [
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.6),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListTile(
                  title: Text(details['name'],
                      style: boldViewDown.copyWith(
                        fontSize: ExtraLargeSize,
                        color: Colors.white)),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: AppSecondaryColor,
                    onPressed: () {
                     // widget.category = category;
                    },
                  ),
                ),
                  
                      
                  ),
                ),
            ]),
    ));
  }
}
