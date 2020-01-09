import 'package:flutter/material.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';

class PrtEvents extends StatefulWidget {
  PrtEventsState createState() => PrtEventsState();

}

class PrtEventsState extends State<PrtEvents>{
  
  // List<HomeJson> data = []; 
  // HomeJson online = HomeJson();

  DB db = DB();

 

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(ThirdBackgroundImage), fit: BoxFit.cover),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black.withOpacity(.7)),
          ),
          ListView.builder(
              itemCount: db.events.length,
              itemBuilder: (context,index)=> listBuilder(context, index)
              
            ),

        ]);
    
 
   
    //  StreamBuilder(
    //   stream: Firestore.instance.collection('events').snapshots(),//fetchdata(),
    //   builder: (context,snapshot){
    //     if (!snapshot.hasData){
    //        return Center(
    //          // margin: EdgeInsets.symmetric(vertical:130, horizontal: 170),
    //           child:CircularProgressIndicator(),
    //         );
    //     }
    //     else{
    //       if(snapshot.data.documents.length==0){
    //         return PlaceHolder();

    //       }else{
    //         return ListView.builder(
    //           itemCount: snapshot.data.documents.length,
    //           itemBuilder: (context,index)=> listBuilder(context, index, snapshot)
              
    //         );
    //       }
    //     }

    //   });
        
  }


// Future <List<HomeJson>> fetchdata() async{
//   var response = await http.get(online.url);
//   if (response.statusCode ==200){
//     var jsonData = json.decode(response.body);
//     for (var i in jsonData){
//       online = new HomeJson(
//         banner : i['banner'],
//         description : i['description'],
//         name : i['name'],
//         datePosted :i['date'],
//         displayPicture :i['picture'],
//         email: i['email']
//       );
    
      
//       data.add(online);
//     }

//   }
//   else{
//     throw Exception('Failed to Load');
//   }
  
    
//     return data;
  
// }

  Widget listBuilder(BuildContext context, int index){//, AsyncSnapshot snapshot){
    final org = db.events[index]['organizer'];
  return Card(
    color: Colors.grey[600].withOpacity(.4),
    margin: const EdgeInsets.fromLTRB(10,10,10,10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    child: Container(
      padding: const EdgeInsets.only(bottom:40),
      child:Column(
      children: <Widget> [            
        Container(
          height: 250,
          child: Container(
                decoration: BoxDecoration(  
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)), 
                  image: DecorationImage(
                    image:AssetImage(db.events[index]["banner"]),
                 //   (snapshot.data.documents[index]['banner']),
                    fit: BoxFit.cover
                  )             
                  
                ),
                )
          ),
                
  
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(db.organizers[org]["profile"]),
            radius: 30,
            
          ),
          title: Text(
            db.events[index]['title'],
            style:boldViewDown.copyWith(
              color: Colors.white,fontSize: LargeFontSize)),
          subtitle: Text(db.events[index]['start_date'],
          style:TextStyle(color: AppSecondaryColor)),  //Text('Date'),
         
          
          onTap: () {                
            Navigator.pop(context);
          },
        ),
      
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(db.events[index]['description'],
          style: TextStyle(color:Colors.grey[400]),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,),
        )
    ]))

  );
}
}