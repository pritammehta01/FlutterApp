import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/CustomePage/home_page.dart';
import 'package:my_app/CustomePage/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "Login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child:
            Center(child: "Shop Now".text.bold.xl4.color(Colors.white).make()),
      ),
    );
  }

  void whereToGo() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var isLogedIn = sharedPrefs.getBool(KEYLOGIN);
    Timer(
      Duration(seconds: 3),
      () {
        if (isLogedIn != null) {
          if (isLogedIn) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      },
    );
  }
}
