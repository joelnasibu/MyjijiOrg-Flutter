import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organizer/models/db.dart';
import 'package:organizer/style.dart';

class TabAddons extends StatefulWidget {
  @override
  _TabAddonsState createState() => _TabAddonsState();
}

class _TabAddonsState extends State<TabAddons> with SingleTickerProviderStateMixin{
 
  
  AnimationController _cnt;
  Animation<double> animation;

   DB db = DB();
  
  List<String> populate = List<String>();

  String _productSelected;
  String _newProductSlt;
  String _subSelected;
  String _addedCat;
  String imageLink ;
  bool enableChecked=false;
  bool secondCheck = false;
  bool portion = false;
  int price= 0;
  Future<File> uploaded;

  TextEditingController _edtController = TextEditingController();
  TextEditingController _edtCatController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cnt = AnimationController(vsync:this, duration: Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    

    final section_1 = Container(
       padding: EdgeInsets.all(24),
      child: Text("Select from the list what you wish to sell together with the ticket",textAlign: TextAlign.justify,style: TextStyle(
        fontSize: SmallFontSize,
      )),
    
    );

    final section_2 = Container(
      
      child:  DropdownButtonFormField(
                validator:(val){
                  if (val ==null){
                    return 'Please Select Product Categories';
                  }
                },
                hint: Text('Product Categories',style: TextStyle(fontSize: SmallFontSize)),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]))),
                         
                value: _productSelected,
                onChanged: (val){
                  setState(() {
                    _productSelected = val; 
                   
                    _subSelected = null;
                    imageLink = null;
                    price = 0;
                    populate = db.products[_productSelected].keys.toList();
                    
                  });
                },
                items: db.products.keys.map((val)=>                  
                  DropdownMenuItem<String>(                    
                    child: Text(val),
                    value: val
                    
                  )).toList()
      )
              
      
     );
   
    final section_3 = Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child:DropdownButtonFormField(
         validator:(value){
                  if (value == null){
                    return 'Please Select Sub Categories';
                  }
                },
                hint: Text('Select Product',style: TextStyle(fontSize: SmallFontSize)),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]))),
                         
                value: _subSelected,
                onChanged: (value){
                  setState(() {
                    _subSelected = value;

                    price = db.products[_productSelected][_subSelected]['price'];
                    imageLink = db.products[_productSelected][_subSelected]['picture'];
                    
                  });
                }, 
                 items: populate==null?null:populate.map((val)=>
                 DropdownMenuItem(
                  child: Text(val),
                  value: val
                )).toList(),              
      )        
    );
    
    final section_4 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          enableChecked?Expanded(
            child: TextFormField(
              onSaved: (val){
                price = int.parse(val);
              },
              keyboardType: TextInputType.number,
              controller: _edtController,
              decoration: InputDecoration(     
                contentPadding: EdgeInsets.all(8.0),
                border: OutlineInputBorder(                           
                  borderRadius: BorderRadius.circular(10),
                ),           
                enabledBorder: OutlineInputBorder(                  
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[300]),
                )
              ),
            ),
          ):
          Container(
            padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:Colors.grey[300])
            ),
            child:Text('KES $price',style: TextStyle(
                    fontSize: NormalFonteSize,
                    color: AppPrimaryColor,
                    fontWeight: FontWeight.w700
            ))
          ),

          Expanded(
            child:enableChecked?
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child:RaisedButton(
                color: AppSecondaryColor,                
                child: Text('Save',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,

                )),
                onPressed: (){
                  final form = formKey.currentState;

                  setState(() {
                  form.save();
                  enableChecked = !enableChecked;
                  });

              
              },
            ))
            :CheckboxListTile(              
              title: Text('Edit'),
              value: enableChecked,
              onChanged: (val)=>
                setState((){
                  enableChecked = val;
                  _edtController.text = price.toString();
                  
                })
          )),
          Container(
            width: 50,
            height: 50,
            child: imageLink!=null?
              FadeInImage.assetNetwork(
                image: imageLink,
                placeholder: SystemImagePath +'circlebar.gif'):
              Image.asset(SystemImagePath +'imageplaceholder.jpg')  
          )
        ],
      ),
    );
    
    final section_5 = Container(
      padding: EdgeInsets.only(top:10),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding:EdgeInsets.all(16.0),
          child:Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: secondCheck?
                        TextFormField(
                          onFieldSubmitted: (val){
                           _addedCat = val;
                          },
                          controller: _edtCatController,
                          decoration: InputDecoration(     
                          contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(                           
                              borderRadius: BorderRadius.circular(10),
                            ),           
                            enabledBorder: OutlineInputBorder(                  
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300]),
                            )
                          ),
                        )
                      :DropdownButtonFormField(
                      
                        decoration: InputDecoration(
                          hintText:'Select Category',
                          hintStyle: TextStyle(fontSize: TinyFontSize),
                          contentPadding: EdgeInsets.all(8.0),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]))),
                              
                        value: _newProductSlt,
                        items: db.products.keys.map((val)=>
                          DropdownMenuItem(
                            child:Text(val),
                            value:val)
                        ).toList(),

                        onChanged: (val){
                          _newProductSlt = val;
                        },
                        

                      ),
                    ),


                    Expanded(
                     child:secondCheck?
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.0),
                        child:RaisedButton(
                          color: AppSecondaryColor,                
                          child: Text('Save',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,

                          )),
                          onPressed: (){
                            setState(() {
                              if(_addedCat!=null){
                                db.products.addAll({
                                  _addedCat:""
                                  });
                                  _newProductSlt = _addedCat;
                                
                              }
                              formKey.currentState.save();
                              secondCheck = !secondCheck;
                             
                            });

                        
                        },
                      ))
                      :CheckboxListTile(              
                        title: Text('New Category',style: TextStyle(
                          fontSize: TinyFontSize,
                        ),),
                        value: secondCheck,
                        onChanged: (val)=>
                          setState((){
                            secondCheck = val;
                           // _edtCatController.text = price.toString();
                            
                          })
          )),
                    
                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(vertical:10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(                        
                        hintText: "Add Item ",
                        hintStyle: TextStyle(fontSize: TinyFontSize),
                        contentPadding: EdgeInsets.all(8.0),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300]))),
                         
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextFormField(  
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: TinyFontSize),
                        hintText: "Add Price",
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]))),
                         
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width:70,
                      height:70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(SystemImagePath+'imageplaceholder.jpg')
                        )
                      ),

                    child: FutureBuilder(
                      future: uploaded,
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done &&
                        snapshot.data!=null){
                          return Container(
                            width:70,
                            height:70,
                            decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(snapshot.data),
                              fit: BoxFit.cover
                            )
                          ));

                        }
                        else if(snapshot.error !=null){
                          return Container();
                        }
                        else{
                          return InkWell(
                            onTap: (){
                              setState(() {
                                uploaded = ImagePicker.pickImage(source: ImageSource.gallery);
                              });
                      
                            },                      
                            child:Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(SystemImagePath+'imageplaceholder.jpg')
                                  )
                                )
                            )
                        
                          );
                        }
                      }
                            
                ),
                  ),
                Container(                  
                  child: RaisedButton(
                    color: AppSecondaryColor,
                    child: Text("Save Addon",style:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.bold
                    )),
                    onPressed: (){
                      setState(() {
                       portion = !portion; 
                       uploaded = null;
                        Fluttertoast.showToast(
                          msg: 'Coming Soon',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      });

                    },
                  ),
                )
              ],),
            )
            ],
            


          ),
        ),
      ),
    );

    final section_6 = Card(
      margin: EdgeInsets.symmetric(horizontal:16,vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: RaisedButton(
          color: AppSecondaryColor,
          child:Text('New Addons',style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold
          ),),
          onPressed: (){
            setState(() {
              
            portion = !portion;
            });
          },
          
        )
      ,),
    );

    final section_7 = Container(
      width: MediaQuery.of(context).size.width,      
      margin: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        border: Border.all(color:AppSecondaryColor)
      ),
      child:RaisedButton(
        color: AppPrimaryColor,        
        child: Padding(          
          padding: const EdgeInsets.all(18.0),
          child: Text('Save',style: boldViewDown.copyWith(color:AppSecondaryColor),),
        ),
        onPressed: (){
          final form = formKey.currentState;
          if(form.validate()){
            form.save();
          }
          Fluttertoast.showToast(
              msg:"Coming Soon",
              toastLength: Toast.LENGTH_SHORT);
        },
    ));

    

    return Container(
      padding: EdgeInsets.symmetric(horizontal:16),

      child: Form(
        key: formKey,
        child:ListView(
        children: [
          section_1,
          section_2,
          section_3,
          section_4,
          portion?section_5:section_6,
          section_7
        ],      
    ))
    );

  }
}

