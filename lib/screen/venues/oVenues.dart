import 'package:flutter/material.dart';
import 'package:organizer/style.dart';

class Venue extends StatefulWidget {
  @override
  _VenueState createState() => _VenueState();
}

class _VenueState extends State<Venue> {

  Map<String,dynamic> venues = {
    'Nairobi Live':{
                    'picture':'assets/images/banners/Nairobi.jpg',
                    'address':'tiona lasdob sdjfol',
                    'date':'12-09-2019',
                    'price':70.0,
                    'rate': 3.5,
                    'Total': 35000  
                  },
     'Matchakos Sport':{
                    'picture':'assets/images/banners/business-events-tegel.jpg',
                    'address':'',
                    'date':'',
                    'price':0.0,
                    'rate': 3.5,
                    'Total': 35000    
                  },
     'Nairobi Live':{
                    'picture':'assets/images/banners/Nairobi.jpg',
                    'address':'',
                    'date':'',
                    'price':0.0,
                    'rate': 3.5,
                    'Total': 35000    
                  },
     'Nairobi Live':{
                    'picture':'assets/images/banners/Nairobi.jpg',
                    'address':'',
                    'date':'',
                    'price':0.0,
                    'rate': 3.5,
                    'Total': 35000    
    },
     'Nairobi Live':{
                    'picture':'assets/images/banners/Nairobi.jpg',
                    'address':'',
                    'date':'',
                    'price':0.0,
                    'rate': 3.5,
                    'Total': 35000    
    },
     'Nairobi Live':{
                    'picture':'assets/images/banners/Nairobi.jpg',
                    'address':'',
                    'date':'',
                    'price':0.0,
                    'rate': 3.5,
                    'Total': 35000    
    },
     'Nairobi Live':{
                    'picture':'assets/images/banners/Nairobi.jpg',
                    'address':'',
                    'date':'',
                    'price':0.0,
                    'rate': 3.5,
                    'Total': 35000    
    }

  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot Event'),
      ),
      backgroundColor: Colors.black,
      body: Container(),
    );
  }
}