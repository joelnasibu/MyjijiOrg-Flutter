import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/screen/home/oHomepage.dart';
import 'package:organizer/style.dart';

class SPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16,10,16,70),
      color: Colors.grey[100],
      child: CustomScrollView(
      slivers:[
        SliverList(
             delegate: SliverChildListDelegate([

               _bookingLayout('Nairobi Event',545,456,"assets/images/display_pictures/Barbara.jpg"),

               _bookingLayout('Miss World Kenya',145,124,"assets/images/display_pictures/bert.jpg"),

               _bookingLayout('Nairobi Live Concert',450,123,"assets/images/display_pictures/james.jpg"),

               _bookingLayout('Ortega Festival',245,197,"assets/images/display_pictures/Hellen.jpg"),

               _bookingLayout('Nairobi Event',245,197,"assets/images/display_pictures/Naomi.jpg"),

               _bookingLayout('Nairobi Event',245,197,"assets/images/display_pictures/john.jpg"),
             ]))


     ])
    );
  }


  _bookingLayout(String title, int number, int likes,String image ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:4.0,vertical: 4.0),
      child: Card(
          color: Colors.white,
          child: ListTile(
            onTap: (){
              Fluttertoast.showToast(
                msg: '$title clicked\nComing Soom',
                toastLength: Toast.LENGTH_SHORT

              );
            },
            leading: CircleAvatar(
              radius:25,
              backgroundImage: AssetImage(image)),
            title: Text(title,style: boldView.copyWith(fontSize: SmallFontSize,color: Colors.black),),
            subtitle: Row(
              children:[
                Icon(Icons.bookmark_border,size:15,color: AppPrimaryColor),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$number bookings',style: TextStyle(fontSize: TinyFontSize,color: AppPrimaryColor)),
                ),
              ]
            ),
            trailing:Text('$likes likes',style: TextStyle(fontSize: TinyFontSize,color: Colors.blue)),

            

          )
        ),
    );
  }
}