import 'package:flutter/material.dart';
import 'package:virtualmarriageME/screens/login/IntroScreen.dart';
import 'package:virtualmarriageME/screens/splashScreen.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('ss '+PreferenceHelper.getValueFromPreference(keyValue.showIntro.toString()).toString());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: SplashScreen(),
      home: true ? IntroScreen() : SplashScreen(),
    );
  }
}
