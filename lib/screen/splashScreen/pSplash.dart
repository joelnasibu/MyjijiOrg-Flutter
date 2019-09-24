import 'package:flutter/material.dart';
import 'package:organizer/screen/signIn/oSignIn.dart';
import 'package:organizer/screen/signUp/oSignup.dart';
import 'package:organizer/style.dart';

class PrtSplash extends StatefulWidget {
  @override
  _PrtSplashState createState() => _PrtSplashState();
}

class _PrtSplashState extends State<PrtSplash> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
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
            margin: EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'myLogo',
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                          child: Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(AppLogo),
                                fit: BoxFit.contain,
                              ))))),
                ),
                Container(
                  height: screenHeight * .35,
                  margin: EdgeInsets.symmetric(horizontal: 50.0),
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white.withOpacity(.4),
                  ),
                  width: screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: AppPrimaryDark),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: MaterialButton(
                          textColor: AppPrimaryDark,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                          child: Text(
                            "Sign In ",
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
                          color: AppPrimaryDark,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
