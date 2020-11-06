import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtualmarriageME/model/IntroSliderModel.dart';
import 'package:virtualmarriageME/screens/splashScreen.dart';
import 'package:virtualmarriageME/utils/HexColor.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';
import 'package:firebase_core/firebase_core.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

  class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<IntroSliderModel> mySLides = new List<IntroSliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? HexColor("EE829C") : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    mySLides = getSlides();
    controller = new PageController();
  }

  void init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)]
          )
      ),*/
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Container(
          //height: MediaQuery.of(context).size.height ,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: mySLides[0].getImageAssetPath(),
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[1].getImageAssetPath(),
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[2].getImageAssetPath(),
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
              )
            ],
          ),
        ),
        bottomSheet: slideIndex != 2 ? Container(
          //color: Color(0xFF00ff00),
          //margin: EdgeInsets.symmetric(vertical: 16),
          height: Platform.isIOS ? 70 : 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "SKIP",
                  style: TextStyle(color: HexColor("EE829C"), fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],),
              ),
              FlatButton(
                onPressed: (){
                  print("this is slideIndex: $slideIndex");
                  controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "NEXT",
                  style: TextStyle(color: HexColor("EE829C"), fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ],
          ),
        ): InkWell(
          onTap: (){
            PreferenceHelper.saveValueInPreference(keyValue.showIntro.toString(), "true");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen(),),);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => HowToUse(),),);
          },
          child: Container(
            height: Platform.isIOS ? 70 : 60,
            color: Color(0xFFEE829C),
            alignment: Alignment.center,
            child: Text(
              "GET STARTED NOW",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      //padding: EdgeInsets.symmetric(horizontal: 100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            height: 120,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(imagePath)
              ]

          ),

          SizedBox(
            height: 40,
          ),
          Text(title, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22
          ),),
          SizedBox(
            height: 20,
          ),
          Text(desc, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16))
        ],
      ),
    );
  }
}