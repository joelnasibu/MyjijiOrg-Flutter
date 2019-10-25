import 'package:flutter/material.dart';
import 'package:organizer/style.dart';


class TabPackages extends StatefulWidget {
  @override
  _TabPackagesState createState() => _TabPackagesState();
}

class _TabPackagesState extends State<TabPackages> {
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
    return Card(
      margin: EdgeInsets.all(15.0),
      elevation: 10.0,
      child:ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context,index)=>_buildPackage(index),
      )
    );


  }

  _buildPackage(int index){
    return Column(
      children:[
        ListTile(
          title: Text(packages[index]['package'],style: TextStyle(fontWeight: FontWeight.w700),),
          subtitle: Text(packages[index]['Admission']),
          trailing: Text("KES ${packages[index]['Rate']}",style: TextStyle(fontWeight: FontWeight.w700),),

        ),
        Divider(color: Colors.grey,indent: 15,endIndent: 15,),
      ]);
  }
}
