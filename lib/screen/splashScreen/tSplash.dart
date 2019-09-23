import 'package:flutter/material.dart';
import 'package:organizer/screen/signIn/oSignIn.dart';
import 'package:organizer/screen/signUp/oSignup.dart';
import 'package:organizer/style.dart';

class TabSplash extends StatefulWidget {
  @override
  _TabSplashState createState() => _TabSplashState();
}

class _TabSplashState extends State<TabSplash> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(SystemImagePath + 'resort.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            color: Colors.black.withOpacity(.4),
          ),
          Container(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60.0),
                padding: EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white.withOpacity(.4),
                ),
                width: screenWidth / 2,
                height: screenHeight * .6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: AppPrimaryColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: MaterialButton(
                        textColor: AppPrimaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: NormalFonteSize,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: AppPrimaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: MaterialButton(
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: NormalFonteSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
