import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';

class SPage extends StatelessWidget {
  DB db = DB();
  int position;

  SPage({Key key,@required this.position}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return position!=null?Container(
      padding: EdgeInsets.fromLTRB(16,10,16,70),
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: db.events[position]['bookings'].length,
        itemBuilder: (context,index)=> _bookingLayout(index)
     )
    ):
    Center(
      child: Text('No Event selected',style: boldViewDown.copyWith(fontSize: ExtraLargeSize),),
    );
  }


  _bookingLayout(int i){
    final names = db.events[position]['bookings'][i];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:4.0,vertical: 4.0),
      child: Card(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color:AppSecondaryColor,width: 5))
            ),
            child:ListTile(
            onTap: (){
              Fluttertoast.showToast(
                msg: '${names['names']} clicked\nComing Soom',
                toastLength: Toast.LENGTH_SHORT

              );
            },
            leading: CircleAvatar(
              radius:25,
              backgroundImage: NetworkImage(names['picture'])),
            title: Text(names['names'],style: boldView.copyWith(fontSize: SmallFontSize,color: Colors.black),),
            subtitle: Row(
              children:[
                Icon(Icons.bookmark_border,size:15,color: AppPrimaryColor),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Payment Mode : ${names['payment']}',style: TextStyle(fontSize: TinyFontSize,color: AppPrimaryColor)),
                ),
              ]
            ),
            trailing:Text('Pax ${names['pax']}',style: TextStyle(fontSize: TinyFontSize,color: Colors.blue)),

            
            )
          )
        ),
    );
  }
}