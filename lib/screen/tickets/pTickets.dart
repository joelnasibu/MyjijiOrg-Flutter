import 'package:flutter/material.dart';
import 'package:organizer/style.dart';


class PrtTickets extends StatefulWidget {
  @override
  _PrtTicketsState createState() => _PrtTicketsState();
}

class _PrtTicketsState extends State<PrtTickets> {
  List <String> ticketsCategory = [
    'Platnum Members', 'Gold Members', 'Regular Members'
  ];
  String selected = null;
  @override
  Widget build(BuildContext context) {

    final section_1 = Container(
      padding: const EdgeInsets.all(16.0),
      child: Text('Tickets Sales',style: boldViewDown,),
    );
   
    final section_2 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10.0),
      height: 140,
      decoration: BoxDecoration(        
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[300])
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(                
                  underline: DropdownButtonHideUnderline(child: Text("")),
                  hint: Text('Select Category'),
                  value: selected,
                  onChanged: (value){
                    setState(() {
                     selected = value; 
                    });
                  },
                  items: ticketsCategory.map( (val) => DropdownMenuItem(
                    value: val, child: Text(val,style:boldViewDown.copyWith(fontSize: SmallFontSize))
                  )).toList(),


                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text('Sales of now',style: boldView.copyWith(fontSize: 16.0),),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal:12, vertical:16.0),
                child: Text('Advantage Code',style: boldViewDown.copyWith(color: AppPrimaryDark,fontSize: 14.0))
              ),
              Text('GOLDDHA345'),
            ],
          ),
        ],
      ),

    );
    
    
    final section_3 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10.0),
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[300])
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('Events',style: boldViewDown.copyWith(color: AppPrimaryDark),),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context,index)=> _eventBuilder(context, index),
          )
        ],

      ),
    );

    final section_4 =  Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(35),topRight: Radius.circular(35.0))
      ),
      padding: EdgeInsets.symmetric(horizontal:10.0,vertical: 16),
      
     // margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppPrimaryDark,
          radius: 30,
          child: Icon(Icons.attach_money,size:30,color:Colors.white)
          ),
        title: Text('Revenue',style: boldViewDown),
        trailing: Text("\$ 9,489",style: boldViewDown.copyWith(
          fontSize: ExtraLargeSize,
          color: Colors.green)),
      ),
    );


    

    return ListView(
      children: <Widget>[
        section_1,
        section_2,
        section_3,
        section_4
      ],
    );
  }

  List<String> title = [
    'Nairobi Live',
    'MissWorld KEN',
    'WildCard Event',
    'Tryme Challenge'
  ];

  _eventBuilder(BuildContext context, int position){
    return Container(
      padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300])
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title[position],style: boldViewDown.copyWith(
                  fontSize: 16.0
                ),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Text("Tickets sold 1345"),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Safari Park",style:boldViewDown.copyWith(
                  color:AppPrimaryDark,fontSize: 16.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Text("23-06-2019"),
                ),
              ],
            ),
          ),
        ],
      )
    );




  }
  

}
