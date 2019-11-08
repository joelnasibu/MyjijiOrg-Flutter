import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/style.dart';

class FPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(8.0,8.0,16,70),
      color: Colors.grey[100],
      child: CustomScrollView(
      slivers:[
        SliverGrid.count(
             crossAxisCount: 2,
             children: <Widget>[
               _bookingLayout(context,'Nairobi Event',545,456,"https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg"),

               _bookingLayout(context,'Miss World Kenya',145,124,"https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg"),

               _bookingLayout(context,'Nairobi Live Concert',450,123,"https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg"),

               _bookingLayout(context,'Ortega Festival',245,197,"https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg"),

               _bookingLayout(context,'Nairobi Event',245,197,"https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg"),

               _bookingLayout(context,'Nairobi Event',245,197,"https://www.vividfeatures.com/wp-content/uploads/2017/01/kenya-at-50-640x313.jpg"),
             ])


     ])
    );
  }


  _bookingLayout(BuildContext context,String title, int number, int likes,String image ){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          Fluttertoast.showToast(
            msg: '$title\n Coming Soon',
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0)),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover
                    )
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text(title),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0,bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.bookmark,color: AppPrimaryColor,size: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text('$number Bookings',style:TextStyle(color:AppPrimaryColor,fontSize: TinyFontSize)),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:10.0,right:10.0,bottom:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite,color:Colors.blue[800],size: 20,),
                    Container(
                      width: 100,
                      child: Text('$likes Following', style: TextStyle(fontSize:TinyFontSize,color:Colors.blue[800]))),
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