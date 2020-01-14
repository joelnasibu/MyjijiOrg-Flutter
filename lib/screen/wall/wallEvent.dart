import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/models/user.dart';
import 'package:organizer/style.dart';

class WallEvent extends StatefulWidget {
  @override
  _WallEventState createState() => _WallEventState();
}

class _WallEventState extends State<WallEvent> with TickerProviderStateMixin {
  
  DB db = DB();
  var id  = User().getUser();

  var pendingCount = List<int>();
  var upcomingCount = List<int>();
  var completedCount = List<int>();


  Widget _titleSection(String title){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
      color: Colors.grey[300],
      child:Text(title.toUpperCase(),style: boldView.copyWith(color: Colors.grey,fontSize: BodyFontSize)),

    );
  }

  _getStatus(int value){
    String status = db.eventStatus[value];
    return status;
  }

  _settingcount(){
    pendingCount.clear();
    upcomingCount.clear();
    completedCount.clear();

    
    for (var i = 0 ; i< db.events.length;i++){      
       if (i==0){
         //Pending count
         pendingCount.add(i);
       }
       else if (i==1){
         //upcoming count
         upcomingCount.add(i);

       }

       else{
         //completed count

         completedCount.add(i);
       }
    }
    
    
  }

  @override
  Widget build(BuildContext context) {

    _settingcount();

    final pending = Column(
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.stretch,
      children:[
        _titleSection("Pending Event"),
        Container(
          padding: EdgeInsets.symmetric(horizontal:18.0,vertical: 10),
          color: Colors.blueGrey,
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
              itemBuilder:(context,index) => _pending(index),
              itemCount: pendingCount.length,
          ),
        ),

      ]
    );

    final upcoming = Container(
       height: 200,
       child: 
      ListView.builder(
       scrollDirection: Axis.horizontal,
       shrinkWrap: true,
       physics: ClampingScrollPhysics(),
        itemBuilder:(context,index) => _upcoming(index),
        itemCount: db.events.length,
      )
     
    );
   
    final completed = Container(
      margin:EdgeInsets.symmetric(horizontal:8.0),
      color: Colors.white,

      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: db.events.length,
        itemBuilder: (context, index)=> _completed(index)
      ),
    );
    
    return ListView(
        children: <Widget>[
          pendingCount.length!=0?pending:Container(),
          upcomingCount.length!=0?upcoming:Container(),
          completedCount.length!=0?completed:Container(),

         ],
      
    );
  }


  _pending(int i){
    return Material(
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
     
      child:  Container(
        width: 200,
        child: Column(
          children:[
             Container(
               height: 180,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(

                  borderRadius:BorderRadius.only(
                     topLeft: Radius.circular(4),
                     topRight: Radius.circular(4)
                   ),
                  
                  image: DecorationImage(                
                    image: AssetImage(db.events[i]['banner']),
                    fit:BoxFit.cover,
                 ),

               ),
               child: Container()
             ),
             
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                child: FlatButton.icon(                  
                  label: Text("Resume"),
                  icon: Icon(Icons.play_arrow),
                  color: AppSecondaryColor,
                  onPressed: (){

                  },
                ),
              ),

              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.close,color: Colors.white),                
                  color: Colors.red[800],
                  label: Text("Cancel Process",style: TextStyle(
                    color: Colors.white
                  )),
                  onPressed: (){
                    setState(() {
                      print(upcomingCount);
                      upcomingCount.removeAt(i);
                      print(pendingCount);
                      
                    });
                  },
                  
                ),
              )
               
          ]
        ),
      )
    );
  }

  _upcoming(int i){
    return Material(
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
     
      child:  Container(
        width: 200,
        child: Column(
          children:[
             Container(
               height: 180,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(

                  borderRadius:BorderRadius.only(
                     topLeft: Radius.circular(4),
                     topRight: Radius.circular(4)
                   ),
                  
                  image: DecorationImage(                
                    image: AssetImage(db.events[i]['banner']),
                    fit:BoxFit.cover,
                 ),

               ),
               child: Container()
             ),
             
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                child: FlatButton.icon(                  
                  label: Text("Resume"),
                  icon: Icon(Icons.play_arrow),
                  color: AppSecondaryColor,
                  onPressed: (){

                  },
                ),
              ),

              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.close,color: Colors.white),                
                  color: Colors.red[800],
                  label: Text("Cancel Process",style: TextStyle(
                    color: Colors.white
                  )),
                  onPressed: (){
                    setState(() {
                      print(upcomingCount);
                      upcomingCount.removeAt(i);
                      print(pendingCount);
                      
                    });
                  },
                  
                ),
              )
               
          ]
        ),
      )
    );

  }

  _completed(int i){
    int status= db.events[i]['status'];

    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: Text(status.toString())
      );return Material(
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
     
      child:  Container(
        width: 200,
        child: Column(
          children:[
             Container(
               height: 180,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(

                  borderRadius:BorderRadius.only(
                     topLeft: Radius.circular(4),
                     topRight: Radius.circular(4)
                   ),
                  
                  image: DecorationImage(                
                    image: AssetImage(db.events[i]['banner']),
                    fit:BoxFit.cover,
                 ),

               ),
               child: Container()
             ),
             
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                child: FlatButton.icon(                  
                  label: Text("Resume"),
                  icon: Icon(Icons.play_arrow),
                  color: AppSecondaryColor,
                  onPressed: (){

                  },
                ),
              ),

              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.close,color: Colors.white),                
                  color: Colors.red[800],
                  label: Text("Cancel Process",style: TextStyle(
                    color: Colors.white
                  )),
                  onPressed: (){
                    setState(() {
                      print(upcomingCount);
                      upcomingCount.removeAt(i);
                      print(pendingCount);
                      
                    });
                  },
                  
                ),
              )
               
          ]
        ),
      )
    );
   }







} 
