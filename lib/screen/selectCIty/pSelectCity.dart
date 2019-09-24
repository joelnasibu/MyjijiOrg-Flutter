import 'package:flutter/material.dart';
import 'package:organizer/screen/phonenumber/oPhone.dart';
import 'package:organizer/style.dart';

class PrtSelectCity extends StatefulWidget {
  @override
  _PrtSelectCityState createState() => _PrtSelectCityState();
}

class _PrtSelectCityState extends State<PrtSelectCity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              height: MediaQuery.of(context).size.height * .18,
              color: Colors.grey[200],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back, color: AppPrimaryDark),
                        onPressed: () => Navigator.pop(context)),
                    SizedBox(height: 8.0),
                    Container(
                      margin: EdgeInsets.only(left: 16.0),
                      padding: EdgeInsets.only(left: 16.0),
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(width: 1.5, color: AppPrimaryDark),
                        // width: 2.0,
                        // color: AppPrimaryDark
                      )),
                      child: Text("Select City",
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppPrimaryDark)),
                    )
                  ]),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              height: MediaQuery.of(context).size.height * .78,
              child: Builder(
                builder: (context) => Form(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.only(left: 16.0),
                              hintText: 'Select City',
                              labelStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        Container(
                          child: FloatingActionButton(
                            child: Icon(Icons.navigate_next),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhoneScreen()));
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
