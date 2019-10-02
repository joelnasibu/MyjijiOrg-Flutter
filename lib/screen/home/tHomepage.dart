import 'package:flutter/material.dart';
import 'package:organizer/style.dart';

class TabHomepage extends StatefulWidget {
  TabHomepageState createState() => TabHomepageState();

}

class TabHomepageState extends State<TabHomepage>{
  
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
              itemCount: products.length,
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
  return Card(
    color: Colors.grey[600].withOpacity(.4),
    margin: const EdgeInsets.fromLTRB(10,10,10,40),
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
                    image:NetworkImage(products[index]),
                 //   (snapshot.data.documents[index]['banner']),
                    fit: BoxFit.cover
                  )             
                  
                ),
                )
          ),
                
  
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(products[index]),
            
          ),
          title: Text("snapshot.data.documents[index]['name']",style:TextStyle(color: Colors.white)),
          subtitle: Text("",style:TextStyle(color: Colors.grey[500])),  //Text('Date'),
          trailing:  IconButton(
              color: Colors.orange[400],
              icon: Icon(Icons.arrow_forward_ios),
                // child: Text("Sign up"),
                  onPressed: (){},
              ),
          
          onTap: () {                
            Navigator.pop(context);
          },
        ),
      
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("snapshot.data.documents[index]['description']",
          style: TextStyle(color:Colors.white),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,),
        )
    ]))

  );
}
}