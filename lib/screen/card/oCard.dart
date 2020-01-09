import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';

class Cards extends StatelessWidget {
  DB db = DB();

  List<String> menuoptions = [
    "Edit",
    "Settings"
  ];
  
  final id = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("My Card",style: TextStyle(color: AppPrimaryColor)),
        iconTheme: IconThemeData(color: AppPrimaryColor),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (selected){
              print (selected);
            },
            itemBuilder: (context){
              return menuoptions.map(
                (String val)=>PopupMenuItem<String>(
                  value: val,
                  child: Text(val),
                )
              ).toList();
            },
          ),
        ],
      ),
      body: 
      SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color:Colors.white,
                      image: DecorationImage(
                        image: AssetImage(SystemImagePath+"card.png"),
                        fit: BoxFit.cover
                      )                  
                      
                    ),
                    
                  child: Image.asset(SystemImagePath + "card.png"),
                  ),

                             
              Container(
                color: AppPrimaryDark,
                child: Container(
                  width: screenWidth,
                  height: 250,
                  decoration:BoxDecoration(
                    color:Colors.white,
                    border: Border.all(color:Colors.white,width:0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(60,40)
                    )
                  ),
                  padding: EdgeInsets.only(top: 15,left: 32,),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      Text('Mode of Payment',
                          style: boldViewDown.copyWith(
                              color: AppPrimaryColor)),                 

                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                             _buttonQuick("MPesa", Colors.green[800],false,imagepath:SystemImagePath + "MPesa.png"),
                            _buttonQuick("Visa", AppSecondaryDark,false,imagepath:SystemImagePath + "visa.png"),
                            _buttonQuick("PayPal", Colors.blue[400],false,imagepath:SystemImagePath + "paypal.png"),
                            _buttonQuick("Master Card", Colors.red[400],false,imagepath:SystemImagePath + "mastercard.png"),

                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(0),
                              child:  FlatButton(
                                  color: Colors.red[700],
                                    padding: EdgeInsets.all(2),
                                    child: Icon(Icons.add,color:Colors.white,size: 30,)  ,     
                                    
                                    shape: CircleBorder(),
                                    onPressed: (){},
                              )       
                            )



                          ],

                        ),
                      ),
                    ])),
              ),


                Expanded(
                  child:Container(
                    width: screenWidth,
                    decoration:BoxDecoration(
                      color:AppPrimaryDark,
                      border: Border.all(width:0),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(60,40)
                      )
                    ),
                padding: EdgeInsets.only(top: 24,left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text('WidthDrawals',
                          style: boldViewDown.copyWith(
                              color: Colors.white)),                 

                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            _buttonQuick("Bank", AppSecondaryLight,true,icon:Icons.attach_money,money: 4000),
                            _buttonQuick("ATM", AppSecondaryLight,true,icon:Icons.atm,money: 500),
                          ],

                        ),
                      ),
                    ]),
                  ))
            
                 
              ])),
        );
  }

  Widget _infoWidget(String title, String object,double width) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width/2 -10,
              child:Text(title, style: boldView)),
            
            Container(
              child: Text(
                "${db.organizers[id]['card'][object]}",
                
               // _constObject.convertIntoPhone(db.accounts[id]['card'][object].toString()
              //  ),
                style: TextStyle(color: Colors.grey[500]),
              ),
            )
          ],
        ));
  }


  _buttonQuick(String title, Color color, bool nightmode,{IconData icon,String imagepath, double money}){
    return nightmode
    ?Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          FlatButton(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Container(
              width: 30,
              height: 30,
              child:Icon(icon,color:color,size: 30,),        
            ),
            shape: CircleBorder(),
            onPressed: (){},

        ),
          Expanded(
                      child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(title, 
              style: boldViewDown.copyWith(color:Colors.grey[300]))
        ),
          ),
        
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text("\$ $money",style: boldViewDown.copyWith(color: Colors.grey[300]),),
          )
        
        ])
    )



    :Padding(
      padding: EdgeInsets.all(4),
      child:  FlatButton(
            padding: EdgeInsets.zero,
            child: Container(
              width: 70,
              height: 50,
              child:Image.asset(imagepath,fit: BoxFit.contain),        
            ),
            shape: RoundedRectangleBorder(),
            onPressed: (){},
      )       
    );


  }
}
