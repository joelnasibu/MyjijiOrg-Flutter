import 'package:flutter/material.dart';
import 'package:organizer/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class PrtDashBoard extends StatefulWidget {
  PrtDashBoardState createState() => PrtDashBoardState();

}

class PrtDashBoardState extends State<PrtDashBoard>{
  
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
  String eventName = "Event Name";
  String selectCat = null;

  List <String> _dropevent = [
    'Event 1',
    'Event 2',
    'Event 3',
    'Event 4',
    'Event 5'
  ];

  List <String> _dropCategory = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
  ];





  
  static List< charts.Series<EventPop,String>> createSeries(){
    final mydata = [
        EventPop(1,200,charts.MaterialPalette.black),
        EventPop(2,130,charts.MaterialPalette.deepOrange.shadeDefault),
        EventPop(3,310,charts.MaterialPalette.deepOrange.shadeDefault),
        EventPop(4,300,charts.MaterialPalette.black),
        EventPop(5,200,charts.MaterialPalette.black),
        EventPop(6,320,charts.MaterialPalette.green.shadeDefault),
        EventPop(7,350,charts.MaterialPalette.deepOrange.shadeDefault),
        EventPop(8,150,charts.MaterialPalette.green.shadeDefault),
        EventPop(9,50,charts.MaterialPalette.deepOrange.shadeDefault),
        EventPop(10,250,charts.MaterialPalette.green.shadeDefault),
      ];

    return [
      charts.Series<EventPop,String>(
        data: mydata,
        id: "Tickets",
        domainFn: (EventPop event, _)=> event.attendants.toString(),
        measureFn: (EventPop event, _)=> event.tickets,
      colorFn: (EventPop event,__)=> event.color,
      )
    ];

  } 


 
 

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final section_1 =  Container(
            padding: EdgeInsets.symmetric(horizontal: 28.0,vertical: 10),
            height: 50,                 
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Container(
              width: 200,
              height: 20,
              child: DropdownButton( 
                items: _dropevent.map((value)=> DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                )).toList(),
                underline: DropdownButtonHideUnderline(
                  child: Text(''),
                ),
                hint: Text('Select Event'),
                value: selected,
                onChanged: (value){
                  setState(() {
                   selected = value; 
                   eventName = value;
                  });
                },
                
              )
            ),
          );

    final section_2 = Container(
      height: screenHeight * .3,
      margin: EdgeInsets.symmetric(horizontal:24.0),
      decoration: BoxDecoration(  
        color: Colors.red,
        image: DecorationImage(
          image:AssetImage(SystemImagePath + 'event.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomStart,
        child: Container(
          height: 50,
          color: Colors.black.withOpacity(.6),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(eventName,style:TextStyle(
                color: Colors.white,
                fontSize: NormalFonteSize
              )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.star, color:Colors.yellow,),
                    Icon(Icons.star, color:Colors.yellow,),
                    Icon(Icons.star, color:Colors.yellow,),
                    Icon(Icons.star_half, color:Colors.yellow,),
                    Icon(Icons.star_border, color:Colors.yellow,),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );

    final section_3 = Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: (screenWidth-48) /3,
            decoration: BoxDecoration(
              border: Border(right: BorderSide(width: 1,color: Colors.grey[300]))
            ),
            child: Column(              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  underline: DropdownButtonHideUnderline(
                    child: Text(""),
                  ),
                  value: selectCat,
                  hint: Text("Category"),
                  items: _dropCategory.map((val)=>DropdownMenuItem(
                    child: Text(val,style: boldView,),
                    value: val)).toList(),
                  onChanged: (val){
                    setState(() {
                     selectCat = val; 
                    });
                  },
                ),
                Text("VIP001W",style: boldViewDown,)
              ],
            ),
          ),
          Container(            
            width: (screenWidth-48)/3 ,
             decoration: BoxDecoration(
              border: Border(right: BorderSide(width: 1,color: Colors.grey[300]))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("ATTENDANCE",style: boldView,),
                Text("3489",style: boldViewDown,)
              ],
            ),

          ),
          Container(            
            width:  (screenWidth-48) /3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Ticket Rate",style: boldView,),
                Text("\$ 20",style: boldViewDown,)
              ],
            ),

          )

        ],
      ),
    );

    final section_4 = Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal:24.0,vertical: 10.0),

     child: 
       charts.BarChart(
         createSeries(),
         animate: true,
        
       ),
      
    );
   
   
    final section_5 = Container(
      color: Colors.grey[100],
      padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Statistics',style: boldView.merge(boldViewDown)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3,color: Colors.black)),
                      width: 90,
                      height: 90,
                      child: Center(child:Text("46%",style: boldViewDown,)),
                    ),
                    Text("Platinum",style: boldViewDown,)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3,color: Colors.orange)),
                      width: 90,
                      height: 90,
                      child: Center(child:Text("54%",style: boldViewDown,)),
                    ),
                    Text("Gold",style: boldViewDown.apply(color: Colors.orange),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3,color: Colors.grey[400])),
                      width: 90,
                      height: 90,
                      child: Center(child:Text("100%",style: boldViewDown,)),
                    ),
                    Text("Total",style: boldViewDown.apply(color: Colors.grey[400]),)
                  ],
                ),
              ],
            ),

          )
        ],
      ),
   );
    
    
    final section_6 = Container(
      decoration: BoxDecoration(
        color: AppPrimaryDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),topRight: Radius.circular(35.0))
      ),
      padding: EdgeInsets.symmetric(horizontal:10.0,vertical: 24),
     // margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(Icons.attach_money,size:40,color:AppPrimaryDark)
          ),
        title: Text('Total Income',style: boldViewDown.copyWith(color:Colors.white)),
        trailing: Text("\$ 69,489",style: boldViewDown.copyWith(
          fontSize: ExtraLargeSize,
          color: Colors.yellow)),
      ),
    );





    return ListView(
        children:[
          section_1,
          section_2,
          section_3,
          section_4,
          section_5,
          section_6
         
        ]);   
  }

}





class EventPop {
  int tickets;
  int attendants;
  charts.Color color;

  EventPop(this.attendants,this.tickets,this.color);
}