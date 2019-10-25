import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/style.dart';

class PrtAddons extends StatefulWidget {
  @override
  _PrtAddonsState createState() => _PrtAddonsState();
}

class _PrtAddonsState extends State<PrtAddons> with SingleTickerProviderStateMixin {
  AnimationController _cnt;
  Animation<double> animation;

   Map<String,dynamic> product = { 
    'Soft-Drink':{
      'soda':{
          'price':100,
          'picture':'soda.jpg'
      },
      'Juice':{
          'price':120,
          'picture':'juice.jpg'
      },
      'Water':{
          'price':50,
          'picture':'water.jpg'
      }
    },

    'Accessories':{
      'T-shirt':{
          'price':350,
          'picture':'water.jpg'
      },
      'Hat':{
          'price':500,
          'picture':'water.jpg'
      },
      'Wrist Band':{
          'price':50,
          'picture':'band.jpg'
        }
    },
   
    'Snack':{
      'Pop-Corn':{
          'price':100,
          'picture':'pop.jpg'
      },
      'Candy':{
          'price':30,
          'picture':'candy.jpg'
      },
      'Crisps':{
          'price':80,
          'picture':'water.jpg'
      }
    },
    
    'Alcohol':{
      'Wine':{
          'price':800,
          'picture':'wine.jpg'
      },
      'Spirits':{
          'price':500,
          'picture':'spirits.jpg'
      },
      'Beer':{
          'price':150,
          'picture':'beer.jpg'
      }
    }
  };
  

   Map<String,dynamic> products = {
    'Soft-Drink':['Soda','Juice','Water'],
    'Accessories':['T-Shirt','Hat','Bracelet'],
    'Snack':['Pop-Corn','Chips','Chocolate','Sweets'],
    'Alcohol':['champagne','beer','wine','spirits']
  };

  List<String> populate = List<String>();

  String _productSelected;
  String _subSelected;
  String imageLink ;
  bool enableChecked=false;
  double price= 0.0;
  TextEditingController _edtController = TextEditingController();
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
                    Fluttertoast.showToast(
                      msg: _productSelected,
                      toastLength: Toast.LENGTH_SHORT                      
                    );                    
                   
                    _subSelected = null;
                    populate.clear();
                    for (val in products[_productSelected]){
                     populate.add(val);
                    }
                    
                  });
                },
                items: product.keys.map((val)=>                  
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
              onFieldSubmitted: (val){
                price = double.parse(val);
              },
              keyboardType: TextInputType.number,
              controller: _edtController,
              decoration: InputDecoration(     
                border: OutlineInputBorder(                           
                  borderRadius: BorderRadius.circular(20),
                ),           
                enabledBorder: OutlineInputBorder(                  
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey[300]),
                )
              ),
            ),
          ):
          Container(
            padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color:Colors.grey[300])
            ),
            child:Text('KES $price'),
          ),

          Expanded(
            child:enableChecked?
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child:RaisedButton(
              child: Text('Save'),
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
            
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageLink!=null?
                  NetworkImage(imageLink):
                  AssetImage(SystemImagePath +'imageplaceholder.jpg')
              )
            ),
          )
        ],
      ),
    );
    final section_5 = Container();


    return Container(
      padding: EdgeInsets.symmetric(horizontal:16),

      child: Form(
        key: formKey,
        child:Column(
        children: [
          section_1,
          section_2,
          section_3,
          section_4,
          section_5
        ],      
    ))
    );

  }
}

