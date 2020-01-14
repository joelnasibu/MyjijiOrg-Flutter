import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';


class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  DB db = DB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        elevation: 0,

        centerTitle: true,
        title:Text("Alert"),
        leading: Container(
          padding: EdgeInsets.only(left: 16),
          height: 50,
          child: InkWell(
            child: Image.asset(AppLogo,color:AppSecondaryColor),
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
      ),
      body: ListView.builder(
        itemCount: db.events.length,
        itemBuilder: (context,index)=>_buildAlert(index),

      ),
      
    );
  }

  Widget _buildAlert(int position){
    final eventdate = DateTime.parse(db.events[position]['start_date']);
    final today = DateTime.now();
    final difference = today.difference(eventdate).inDays;
    String days;

    if(difference>0){
      if(difference==1){
        days = 'Yesterday';
      }
      if(difference<7){
        days = '$difference days ago';
      }
      else if(difference==7){
        days = 'a week ago';
      }
      else if (difference>7 && difference<30){
        days = '${(difference/7).ceil()} weeks ago';
      }
      else if ((difference/30).ceil() ==1){
        days = 'a month ago';
      }
      else {
        days = '${(difference/30).ceil()} months ago';
      }
    }
    else if (difference<0){
      if(difference==-1){
        days = 'Tomorrow';
      }
      if(difference>-7){
        days = 'in $difference days';
      }
      else if(difference==-7){
        days = 'in a week';
      }
      else if (difference<-7 && difference>-30){
        days = '${(difference/7).ceil()} weeks ago';
      }
      else if ((difference/30).ceil() == -1){
        days = 'a month ago';
      }
      else {
        days = 'in ${(difference/30).ceil()} months';
      }

    }





    return Card(
      margin: EdgeInsets.fromLTRB(12.0,4.0,12.0,4.0),
      elevation: 4.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: AppSecondaryColor,width: 5))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(db.events[position]['title'],
              style: boldViewDown),
              Text('$days',
              style: TextStyle(color: Colors.grey),),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text(db.events[position]['description'],maxLines:3,overflow: TextOverflow.ellipsis,
                ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                child: Text('View',style: boldViewDown.copyWith(color: AppSecondaryColor),),
                onPressed: (){
                  Fluttertoast.showToast(
                    msg: '${db.events[position]['title']}\nComing Soon',
                    toastLength: Toast.LENGTH_SHORT
                  );
                },
              ),
            )
          ],
        )
      ),
    );

  }
}