import 'package:flutter/material.dart';
import 'package:organizer/screen/confirm_number/oConfirm.dart';
import 'package:organizer/style.dart';

class TabPhone extends StatefulWidget {
  @override
  _TabPhoneState createState() => _TabPhoneState();
}

class _TabPhoneState extends State<TabPhone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              height: MediaQuery.of(context).size.height * .3,
              color: Colors.grey[200],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back, color: AppPrimaryColor),
                        onPressed: () => Navigator.pop(context)),
                    SizedBox(height: 8.0),
                    Container(
                      margin: EdgeInsets.only(left: 16.0),
                      padding: EdgeInsets.only(left: 16.0),
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(width: 1.5, color: AppPrimaryColor),
                        // width: 2.0,
                        // color: AppPrimaryColor
                      )),
                      child: Text("Enter Phone Number",
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppPrimaryColor)),
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
                        Container(
                            child: Builder(
                                builder: (context) => Form(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(8.0),
                                                  hintText: '+254',
                                                  labelStyle: TextStyle(
                                                      fontSize: TinyFontSize),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey[300]))),
                                            ),
                                          ),
                                          SizedBox(width: 20.0),
                                          Expanded(
                                            flex: 5,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(8.0),
                                                  labelStyle: TextStyle(
                                                      fontSize: TinyFontSize),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey[300]))),
                                            ),
                                          )
                                        ])))),
                        Container(
                          child: FloatingActionButton(
                            child: Icon(Icons.navigate_next),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfirmScreen()));
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
