import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:organizer/models/slideleft.dart';
import 'package:organizer/screen/createProfile/oCreateProfile.dart';
import 'package:organizer/screen/splashScreen/oSplash.dart';
import 'package:organizer/style.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcentera';

void main() => runApp(MyOrganizer());

class MyOrganizer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeConfig(),
      home: Splash()
    );
  }
  ThemeData _themeConfig(){
    final baseTheme = ThemeData(
      fontFamily: MainFontFamily
    );

    return baseTheme.copyWith(
      primaryColor              : AppPrimaryColor,
      primaryColorLight         : AppPrimaryLight,
      primaryColorDark          : AppPrimaryDark,
      accentColor               : AppAccentColor,

      buttonColor               : AppSecondaryDark,
      floatingActionButtonTheme : FloatingActionButtonThemeData(
        backgroundColor         : AppSecondaryDark,         
      ),  

      bottomAppBarColor         : AppPrimaryColor, 

     
    );
  }

}


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
 
  @override
  void initState() {     
    super.initState();
    Timer(Duration(seconds: 5),(){
      Route route = SlideLeft(widget:SplashScreen());
        Navigator.pushReplacement(context, route);

      }
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Container(
             
              child: Center(
                child: Hero(
                  placeholderBuilder: (context,size,child){
                    return Opacity(opacity: .2,child: child);

                  },

                  flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext){
                      final Hero hero = toHeroContext.widget;

                      return ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(begin: 0.0,end:1).chain(
                            CurveTween(
                            curve: Interval(0.0, 1.0,
                                curve: PeakQuadraticCurve()
                              ),
                          ))
                        ),
                        child: hero.child,
                      );


                  },
                  

                  tag: 'myLogo',
                  child:Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage(AppLogo),
                        fit: BoxFit.contain,
                      )
                    )
                  )
                )
            )
        ),      
    );
  }



}


class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -10 * pow(t, 2) + 10 * t + 1;
  }
}

