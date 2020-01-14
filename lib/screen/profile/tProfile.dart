import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/models/user.dart';
import 'package:organizer/screen/profile/tabs/fPage.dart';
import 'package:organizer/screen/profile/tabs/sPage.dart';
import 'package:organizer/screen/profile/tabs/tPage.dart';
import 'package:organizer/style.dart';

class TabProfile extends StatefulWidget {
  @override
  _TabProfileState createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile>
    with TickerProviderStateMixin {
 
DB db = DB();
int id = User().getUser();
List <Widget> socialMediaList = List<Widget>();



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    
    var codeSocial = db.organizers[id]['social media'].keys;
    socialMediaList.clear();
            
          for(var i  in  codeSocial){
            
            var name = db.socialMedia[i]['name'];
            var icon = db.socialMedia[i]['icon'];
            var color = db.socialMedia[i]['color'];
            var link  = db.organizers[id]['social media'][i];

            socialMediaList.add(_infoWidget(name, link, screenWidth,icon: icon,color: color));
          }




    final section1 = Stack(
            children:[
              ClipPath(
                clipper: ProfileClip(),
                child: Container(
                    color: AppPrimaryColor,
                    height: 200,
                    ),
              ),
              Container(
                height: 200,
                child:Center(
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)
                    ),
                    elevation: 14.0,
                    child:CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage(db.organizers[id]['profile']),
                  )),
                ),
              ),
              
          ]);


    final section2 = Container(
                child: Column(                  
                  children: <Widget>[
                    Text(
                      db.organizers[id]['name'],
                      style: boldViewDown.copyWith(
                          color: AppSecondaryColor, fontSize: ExtraLargeSize),
                    ),
                    Text(
                      db.organizers[id]['email'],
                      style: boldViewDown.copyWith(
                          color: Colors.grey, fontSize: BodyFontSize),
                    ),
                  ],
                ),
              );

    final section3 = Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child:  Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _infoWidget('Phone number', User().convertIntoPhone(1, "${db.organizers[id]['phone']}"),screenWidth,icon:Icons.phone),
          Divider(),
          _infoWidget('Email', db.organizers[id]['email'],screenWidth,icon: Icons.email),
          Divider(),
          _infoWidget('DOB', db.organizers[id]['dob'],screenWidth,icon: Icons.calendar_today ),
         
        ],
      ),
    );

    Widget _titleSection(String text) => Container(
      padding: EdgeInsets.fromLTRB(24,16,24,0),
      child: Text(text,style: boldView.copyWith(fontSize: NormalFontSize),),
    );
    
    final section4 = Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child:  Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _infoWidget('Mode de Payment', "Visa",screenWidth,icon: FontAwesomeIcons.moneyBill),
          Divider(),
          _infoWidget('My Card Number', User().convertIntoPhone(2, db.organizers[id]['card']['number'].toString()),screenWidth, icon:FontAwesomeIcons.creditCard,),
          Divider(),
          _infoWidget('City', db.organizers[id]['town'],screenWidth,icon: Icons.pin_drop ),
        ],
      ),
    );

    final section5 = Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child:  Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  socialMediaList,
        
        // <Widget>[
         
        //   _infoWidget('Facebook', User().convertIntoPhone(1, "${db.social[id]['phone']}"),screenWidth,icon: FontAwesomeIcons.facebook,color: Colors.blue[900]),
        //   Divider(),
        //   _infoWidget('Twitter', db.organizers[id]['email'],screenWidth, icon: FontAwesomeIcons.twitter,color: Colors.blue),
        //   Divider(),
        //   _infoWidget('Instagram', db.organizers[id]['town'],screenWidth,icon: FontAwesomeIcons.instagram,color: Colors.red[700] ),
        // ],
      ),
    );

    final section6 = Container(
      padding: EdgeInsets.symmetric(vertical:24.0,horizontal: screenWidth/3),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        color: AppSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Logout"),
        ),
        onPressed: (){

        },
      ),
    );
    
    
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:AppBar(
        elevation: 0,

        centerTitle: true,
        title:Text("Profile"),
        leading: Container(
          padding: EdgeInsets.only(left: 16),
          height: 50,
          child: InkWell(
            child: Image.asset(AppLogo,color:AppSecondaryColor),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      body: ListView(
      children:[
        section1,
        section2,        
        _titleSection("Basic Info"),
        section3,
        _titleSection("Configurations"),
        section4,
        _titleSection("Social Media"),
        section5,
        section6

      ])
    );
    
  }

  Widget _infoWidget(String title, String value,double width,{IconData icon, Color color}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal:24,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            icon!=Container()?Icon(icon,size: 15,
            color: color==null?AppSecondaryDark:color,):null,
            Container(
              padding: EdgeInsets.only(left: 10),
              width: width * .4,
              child:Text(title)),
            
            Container(
              child: Text(value,
                style: TextStyle(color: Colors.grey[500],fontSize: SmallFontSize),
              ),
            )
          ],
        ));
  }



}
    
 

class ProfileClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = Path();

    path.lineTo(0, size.height * .75);
    path.quadraticBezierTo(size.width/4,size.height/2, size.width/2, size.height/2);
    path.quadraticBezierTo(size.width * .75, size.height/2, size.width,size.height * .75 );
    path.lineTo(size.width, 0);
    path.close();
    // TODO: implement getClip
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}