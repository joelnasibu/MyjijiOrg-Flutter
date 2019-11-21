import 'dart:math';
import 'package:flutter/material.dart';
import 'package:organizer/style.dart';


class PrtPackages extends StatefulWidget {
  @override
  _PrtPackagesState createState() => _PrtPackagesState();
}

class _PrtPackagesState extends State<PrtPackages> {

  List<Map<String,dynamic>> packages = [
   { 
     "package": "VIP Package",
    "Admission":  "Full Weekend",
    'Rate': 1500,
    'Pax' : 10
    },
    { 
     "package": "VIP Package",
    "Admission":  "Gold Member",
    'Rate': 1400,
    'Pax' : 10
    },
    { 
     "package": "GOLD",
    "Admission":  "Full Weekend",
    'Rate': 1500,
    'Pax' : 10
    },
    { 
     "package": "GOLD",
    "Admission":  "Saturday",
    'Rate': 1400,
    'Pax' : 4
    },

  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context,index)=>_buildPackage(index),
      
    );


  }

    _buildPackage(int index){
    return Card(
      margin: EdgeInsets.fromLTRB(10,10,10,5),
      elevation: 2.0,
          child: Column(
            children:[
              ListTile(
                onTap: (){

                },              
                title: Text(packages[index]['package'],style: TextStyle(fontWeight: FontWeight.w700),),
                subtitle: Text(packages[index]['Admission']),
                trailing: Text("KES ${packages[index]['Rate']}",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.red[800]),),

              ),
            ]),
    );
  }
}
