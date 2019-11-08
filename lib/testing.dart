import 'package:flutter/material.dart';
import 'package:organizer/style.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 2 ));
    animation = Tween(begin: -1.0,end: 1.0).animate(CurvedAnimation(parent: controller ,curve:Curves.easeInOut));

    //controller.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Testing Forms")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airplanemode_active),
        onPressed: (){
          setState(() {
            if(controller.isCompleted == true){
              controller.reverse();
            }
            else{
            controller.forward(); 

            }

          });
        },
      ),
      backgroundColor: Colors.black,
      body: 
      // AnimatedBuilder(
      //   animation: controller,
      //   builder:(context,widget){
      //     return Transform(
      //       child: widget,
      //       transform: Matrix4.translationValues(animation.value * width,0.0,0.0),

      //     );
      //   },
      // child:
      Container(
        width: 500,
        height: 500,
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/systems/mainlogo.png')
          )
        ),
      ),
      
     
    );
  }
}
