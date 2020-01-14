import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/models/user.dart';
import 'package:organizer/style.dart';

class More extends StatelessWidget {


DB db = DB();
int id = User().getUser();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final section1 = Container(
                height: 85,
                color: Colors.grey[300],
                child:Padding(
                  padding: EdgeInsets.only(top:5),
                  child: Image.network("http://www.enviromol.ie/wp-content/uploads/2013/10/commercial-banner-e1383249272209.png",fit:BoxFit.contain
                ))
            );

    
    final section2 = Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child:  Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _infoWidget('Packages',icon:FontAwesomeIcons.boxOpen,feeds: 2),
          Divider(),
          _infoWidget('Mode of Payment',icon:FontAwesomeIcons.creditCard),
          Divider(),
          _infoWidget('Addons',icon: FontAwesomeIcons.plusSquare)
         
         
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

          _infoWidget('Transport',icon: FontAwesomeIcons.bus),
          Divider(),
          _infoWidget('Feedback',icon:Icons.question_answer),
          Divider(),
          _infoWidget('SocialMedia',icon: FontAwesomeIcons.link),
         
        ],
      ),
    );

    final section4 = Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child:  Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _infoWidget('FAQ',icon: FontAwesomeIcons.questionCircle),
          Divider(),
          _infoWidget('Chat with Support',icon: FontAwesomeIcons.inbox),
          Divider(),
          _infoWidget('Privacy Policy',icon: FontAwesomeIcons.key),
          Divider(),
          _infoWidget('Terms of Use',icon: FontAwesomeIcons.file),
         
        ],
      ),
    );

    
    Widget _titleSection(String text) => Container(
      padding: EdgeInsets.fromLTRB(24,16,24,0),
      child: Text(text.toUpperCase(),style: boldViewDown.copyWith(fontSize: BodyFontSize)),
    );
    
    
  
    
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:AppBar(
        centerTitle: true,
        title:Text("More..."),
        leading: Container(
          padding: EdgeInsets.only(left: 16),
          height: 50,
          child: InkWell(
            child: Image.asset(AppLogo,color: AppSecondaryColor),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      body: ListView(
      children:[
        section1,
        _titleSection("MORE CONFIG"),
        section2,             
        _titleSection("EXPLORE"),   
        section3,    
        _titleSection("SUPPORT"),    
        section4,       
       

      ])
    );
    
  }

  Widget _infoWidget(String title,{IconData icon,int feeds}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal:24,vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

              icon==null?Container():
              Icon(icon,size: 20,color:AppPrimaryLight),
           
              Container(
              padding: EdgeInsets.only(left: 20),
              child:Text(title,style: TextStyle(fontSize: BodyFontSize),)),            
            
              ]),
            
            feeds==null?Container():Container(
              alignment: AlignmentDirectional.centerEnd,
              child: CircleAvatar(
                
                radius: 10,
                child:Text(
                  
                  feeds.toString(),
                  style: TextStyle(color: Colors.white,fontSize: SmallFontSize),
                )
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