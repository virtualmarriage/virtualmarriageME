import 'package:flutter/material.dart';
import 'package:virtualmarriageME/screens/login/IntroScreen.dart';
import 'package:virtualmarriageME/screens/splashScreen.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String showIntro = 'true';

  @override
  void initState() {
    super.initState();
    PreferenceHelper.getValueFromPreference(keyValue.showIntro.toString()).then((value) => {
      setState(() {
        showIntro = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: SplashScreen(),
      home: showIntro == "false" ? SplashScreen() : IntroScreen(),
    );
  }
}
