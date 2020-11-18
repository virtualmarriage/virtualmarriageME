import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:virtualmarriageME/screens/HomeScreen.dart';
import 'package:virtualmarriageME/screens/login/LoginScreen.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    PreferenceHelper.getToken().then((value) => {
      print('Token: $value'),
      if(value == null || value == 'null'){
        Timer(Duration(seconds: 3), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginScreen())))
      } else {
        Timer(Duration(seconds: 3), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen())))
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: HexColor("#fff").withOpacity(0.8),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
            ),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/splash_logo.png', width: 200, height: 200,),
                    Text("WELCOME TO", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal),),
                    SizedBox(height: 5,),
                    Text("Virtual Marriage", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal),),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
