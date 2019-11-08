import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/style.dart';


class PrtAddPackages extends StatefulWidget {
  @override
  _PrtAddPackagesState createState() => _PrtAddPackagesState();
}

class _PrtAddPackagesState extends State<PrtAddPackages> {
  final globalkey = GlobalKey<FormState>();
  final promo = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final section_1 = Container(
      padding: const EdgeInsets.all(16.0),
      child: Text('Create Package below',style: boldViewDown,),
    );
   
   
    final section_2 = Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   
                    _textFormTemplate("Package Name"),

                    SizedBox(height: 10.0),

                    _textFormTemplate("Admission Rule"),

                    SizedBox(height: 10.0),

                    _textFormTemplate("Pax"),

                    SizedBox(height: 10.0),

                   

                    SizedBox(height: 10.0), 

                    _textFormTemplate("Discount %"),
                    
                    SizedBox(height: 10.0),

                    Row(
                      
                      children: <Widget>[
                        Expanded(

                          child: _textFormTemplate("PromoCode",controller: promo),

                        ),
                        SizedBox(width: 3,),
                        Container(
                          height: 45,
                          child:RaisedButton(                        
                          color: Colors.black ,
                          child: Text('Generated',style: TextStyle(
                            color:Colors.white
                          ),),
                          onPressed: (){
                            final random = Random();
                            promo.text = random.nextInt(400000000).toString();

                          },
                        )
                        )

                      ],
                    ),

                          
                    SizedBox(height: 50.0),

                   


                   
                  ]),
              
    );

    final section_3 = FlatButton(
        color: AppPrimaryColor,        
        child: Padding(          
          padding: const EdgeInsets.all(18.0),
          child: Text('Save',style: boldViewDown.copyWith(color:Colors.white),),
        ),
        onPressed: (){
          final form = globalkey.currentState;
          if(form.validate()){
            form.save();
          }
          Fluttertoast.showToast(
              msg:"Coming Soon",
              toastLength: Toast.LENGTH_SHORT);
        },
    );

    

    return Form(
      key: globalkey,
      child:ListView(
      children: <Widget>[
        section_1,
        section_2,        
        section_3,

      ],
    ));
  }

  
  Widget _textFormTemplate(String label,{IconData icon, int lines, TextEditingController controller}){
    return TextFormField(   
      controller: controller,
      maxLines: lines!=null? 5: 1, 
      keyboardType: lines!=null?TextInputType.multiline:TextInputType.text ,
      validator: (val){
        if(val.isEmpty){
          return "Please enter $label";
        }
      },

      onSaved: (value){
        setState(() {
        // _event.eventName = label; 
        });
      },
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
