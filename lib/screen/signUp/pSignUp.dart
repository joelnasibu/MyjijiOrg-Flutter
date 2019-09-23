import 'package:flutter/material.dart';
import 'package:organizer/screen/selectCIty/oSelectCity.dart';
import 'package:organizer/screen/signIn/oSignIn.dart';
import 'package:organizer/style.dart';

class PrtSignUp extends StatefulWidget {
  @override
  _PrtSignUpState createState() => _PrtSignUpState();
}

class _PrtSignUpState extends State<PrtSignUp> {
  bool clicked = false;
  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    Color fbColor = Color(0XFF3b5998);
    Color gmlColor = Color(0XFFB23121);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      margin: EdgeInsets.only(left: 16.0),
                      padding: EdgeInsets.only(left: 16.0),
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(width: 1.5, color: AppPrimaryDark),
                      )),
                      child: Text("Sign Up",
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppPrimaryDark)),
                    )
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 50.0, top: 8.0),
              child: Text('Hello,\nWelcome to Myjiji !',
                  style: Theme.of(context).textTheme.display1.copyWith(
                      color: Colors.black,
                      fontSize: NormalFonteSize,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: Builder(
                builder: (context) => Form(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'First Name',
                              prefixIcon: Icon(Icons.person),
                              labelStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'Last Name',
                              prefixIcon: Icon(Icons.person),
                              labelStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              labelStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: clicked ? false : true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: clicked
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    clicked = !clicked;
                                  });
                                },
                              ),
                              labelStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: _clicked ? false : true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: _clicked
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _clicked = !_clicked;
                                  });
                                },
                              ),
                              labelStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 45.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppPrimaryDark,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: MaterialButton(
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectCityScreen()));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: NormalFonteSize,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 8.0),
                                child: Divider(color: Colors.grey[700]),
                              ),
                            ),
                            Text("OR",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey[500])),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, left: 8.0),
                                child: Divider(color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Container(
                            alignment: Alignment.center,
                            child: Text("Sign Up with",
                                style: TextStyle(color: Colors.grey[500]))),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 35.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: fbColor,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: MaterialButton(
                                child: Text("Facebook",
                                    style: TextStyle(
                                        fontSize: SmallFontSize,
                                        color: Colors.white)),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 35.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: gmlColor,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: MaterialButton(
                                child: Text(
                                  "Gmail",
                                  style: TextStyle(
                                      fontSize: SmallFontSize,
                                      color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text("Have an Account?",
                                  style: TextStyle(color: Colors.grey[500])),
                            ),
                            Container(
                              child: MaterialButton(
                                child: Text("Login",
                                    style: TextStyle(
                                      color: AppPrimaryDark,
                                      fontWeight: FontWeight.w700,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignInScreen()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
