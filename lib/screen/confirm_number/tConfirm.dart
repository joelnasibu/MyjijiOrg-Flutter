import 'package:flutter/material.dart';
import 'package:organizer/screen/createProfile/oCreateProfile.dart';
import 'package:organizer/style.dart';

class TabConfirm extends StatefulWidget {
  @override
  _TabConfirmState createState() => _TabConfirmState();
}

class _TabConfirmState extends State<TabConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      child: Text("Confirm Registration",
                          style: Theme.of(context).textTheme.title.copyWith(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                      Container(
                        child: Text(
                          "Wait for confirmation code",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Builder(
                              builder: (context) => Form(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0, vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        TextFormField(
                                          style: TextStyle(
                                            fontSize: ExtraLargeSize,
                                            letterSpacing: 50.0,
                                          ),
                                          maxLength: 4,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(15.0),
                                              hintText: '----',
                                              hintStyle: TextStyle(
                                                  fontSize: LargeFontSize),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey[300]))),
                                        ),
                                        RaisedButton(
                                          child: Text('Resend Code'),
                                          color: AppPrimaryDark,
                                          textColor: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )))),
                      FloatingActionButton(
                        child: Icon(Icons.navigate_next),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateProfileScreen()));
                        },
                      ),
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
