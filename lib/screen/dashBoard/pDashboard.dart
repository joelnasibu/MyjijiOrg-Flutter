import 'package:flutter/material.dart';
import 'package:organizer/style.dart';

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


 

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
        children:[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.0,vertical: 10),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Container(
              width: 15,
              child: DropdownButton(
                
              )
            ),
          )
        ]);   
  }

}