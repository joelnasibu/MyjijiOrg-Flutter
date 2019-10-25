import 'package:flutter/material.dart';
import 'package:organizer/style.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
   final _formKey = GlobalKey<FormState>();

  int num1;
  int num2;
  int sum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Testing Forms")),
      body: Form(
            key: _formKey,
              child: ListView(padding: EdgeInsets.all(24.0), children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter First Number';
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        num1 = int.parse(value);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'First Number',
                      labelStyle: boldView
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Enter Second Number';
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        num2 = int.parse(value);
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Second Number',
                      hintStyle: boldView
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text(sum != null ? sum.toString() : "0"),
                  ),
                  FloatingActionButton(
                    child: Text('save'),
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()){
                        form.save();
                        setState(() {
                           sum = num1 + num2;

                        });
                        
                      }
                     
                    },
                  )
                ]),
              ),
    );
  }
}
