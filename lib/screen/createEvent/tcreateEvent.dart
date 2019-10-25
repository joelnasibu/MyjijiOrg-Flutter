import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organizer/style.dart';

class TabCreateEvent extends StatefulWidget {
  @override
  _TabCreateEventState createState() => _TabCreateEventState();
}

class _TabCreateEventState extends State<TabCreateEvent> {
  Future <File> _banner; 
  
  String _selectedCategory, _selectedAdmission = null;
  List<String> category = ['Platnum','Gold','Ordinary'];
  List<String> admission = [
    'General',
    'General Saturday',
    'General Full Weekend',
    'VIP',
    'VIP Saturday',
    'VIP Full Weekend',
    'Strickly 24+',
    'Gold',
    'Ordinary'
    ];

    DateTime _dateTime;
    TimeOfDay _timer,_ender;
    TextEditingController _cDate = TextEditingController();
    TextEditingController _cStart = TextEditingController();
    TextEditingController _cEnd = TextEditingController();
    


    Future<Null> _showDateDialog(BuildContext context,TextEditingController controller) async {
      final DateTime _datePicked = await showDatePicker(
          context: context,
          initialDate: _dateTime==null? DateTime.now():_dateTime,
          firstDate: DateTime(1980),
          lastDate: DateTime(2030)

        );
        setState(() {
         _dateTime = _datePicked; 
          controller.text = "${_dateTime.day} - ${_dateTime.month} - ${_dateTime.year}";

        });
    }

   Future<Null> _showTimeDialog(BuildContext context, int option,TextEditingController controller) async {
    switch(option){
       case 1:
          final TimeOfDay _timePicked = await showTimePicker(
              context: context,
              initialTime: _timer ==null? TimeOfDay.now():_timer ,
            );
          setState(() {
          _timer  = _timePicked; 
          controller.text = "${_timer.hour}:${_timer.minute}";

          });
        break;
       case 2: 
       final TimeOfDay _timePicked = await showTimePicker(
          context: context,
          initialTime: _ender==null? TimeOfDay.now():_ender,
        );
        setState(() {
         _ender = _timePicked; 
           controller.text = "${_ender.hour}:${_ender.minute}";
        });
        break;
     }

      
    }

  fetchImage (ImageSource source)  {
    setState(() {
     _banner = ImagePicker.pickImage(source:source);
    });

  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    
    final placeHolderContainer = Stack(
      fit: StackFit.passthrough,
      alignment: AlignmentDirectional.bottomCenter,      
      children: <Widget>[
        Container(
          margin:EdgeInsets.all(16.0),
          height: screenHeight *.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(SystemImagePath + 'imageplaceholder.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
         Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            margin: EdgeInsets.all(16.0),
            color: Colors.black.withOpacity(.3),
            child: InkWell(
              onTap: () {
                fetchImage(ImageSource.gallery);
              },
              child: Icon(Icons.camera_alt,size: 30,color: Colors.white),
            )
          )
    ]);

    final section_1 = FutureBuilder<File>(
            future: _banner,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done && snapshot.data != null){
                return Stack(
                  fit: StackFit.passthrough,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      margin:EdgeInsets.all(16.0),
                      height: screenHeight *.5,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        image: DecorationImage(
                          image: FileImage(snapshot.data),
                          fit: BoxFit.cover
                          )
                        ),
                    ),
                  
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      margin: EdgeInsets.all(16.0),
                      color: Colors.black.withOpacity(.3),
                      child: InkWell(
                          onTap: () {
                            fetchImage(ImageSource.gallery);
                          },
                          child: Icon(Icons.camera_alt,size: 30,color: Colors.white),
                        )
                    )
                  ],
                );
              }
              else if (snapshot.connectionState == ConnectionState.active){
                return CircularProgressIndicator();
              }
              else if (snapshot.error != null){
                return Container();
              }
              else{
                return placeHolderContainer;
              }

            },
         
    );

    final section_2 = Container(
             // height: MediaQuery.of(context).size.height,
             // width: MediaQuery.of(context).size.width * .90,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   
                    _textFormTemplate("Event Name"),

                    SizedBox(height: 10.0),

                    DropdownButtonFormField(
                      hint: Text('Category',style: TextStyle(fontSize: SmallFontSize)),
                      value: _selectedCategory,
                      items: category.map( (val)=> DropdownMenuItem<String>(
                        value: val,child: Text(val),
                      )).toList(),
                      onChanged: (val){
                        setState(() {
                         _selectedCategory = val; 
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]))),
                    ),

                    SizedBox(height: 10.0),


                    _textFormTemplate("Description",lines: 5),
                    
                    SizedBox(height: 10.0),

                    DropdownButtonFormField(
                      hint: Text('Event Admission',style: TextStyle(fontSize: SmallFontSize)),
                      value: _selectedAdmission,
                      items: admission.map( (val)=> DropdownMenuItem<String>(
                        value: val,child: Text(val),
                      )).toList(),
                      onChanged: (val){
                        setState(() {
                         _selectedAdmission = val; 
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]))),
                    ),
                    
                    SizedBox(height: 10.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child:Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,8.0,8.0,8.0),
                          child: _textFormTemplate("Date",controller: _cDate),
                          )
                        ),
                        IconButton(
                          icon:Icon(Icons.calendar_today),
                          color:Colors.grey,
                          onPressed: (){
                           _showDateDialog(context,_cDate);
                         
                          },

                        ),

                    ]),

                    SizedBox(height: 10.0),

                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child:Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,8.0,8.0,8.0),
                          child: _textFormTemplate("Start Time",controller: _cStart),
                          )
                        ),
                        IconButton(
                          icon:Icon(Icons.av_timer),
                          color:Colors.grey,
                          onPressed: (){
                           _showTimeDialog(context,1,_cStart);
                          },

                        ),

                    ]),

                    SizedBox(height: 10.0),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child:Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,8.0,8.0,8.0),
                          child: _textFormTemplate("End Time",controller: _cEnd),
                          )
                        ),
                        IconButton(
                          icon:Icon(Icons.timer_off),
                          color:Colors.grey,
                          onPressed: (){
                           _showTimeDialog(context,2,_cEnd);
                           
                          },

                        ),

                    ]),

                   SizedBox(height:10.0),

                    _textFormTemplate('Address',icon: Icons.search),

                    SizedBox(height: 20.0),

                    _textFormTemplate('Other details',lines: 5),
                    
                    SizedBox(height: 10.0),
                  
                  ]),
    );

   
    return ListView(
      children: <Widget>[
        section_1,
        section_2,
      
      ],
      
    );
  }

  Widget _textFormTemplate(String label,{IconData icon, int lines, TextEditingController controller}){
    return TextFormField(   
      controller: controller,
      maxLines: lines!=null? 5: 1, 
      keyboardType: lines!=null?TextInputType.multiline:TextInputType.text ,
      decoration: InputDecoration(                
        suffixIcon: Icon(icon,color: Colors.grey[400],),                
        contentPadding: EdgeInsets.all(10.0),
        labelText: label,
        labelStyle: TextStyle(fontSize: SmallFontSize),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]))),
    );

  }

  
}