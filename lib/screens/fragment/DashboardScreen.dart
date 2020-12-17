
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtualmarriageME/model/BannerData.dart';
import 'package:virtualmarriageME/screens/CustomerSupportScreen.dart';
import 'package:virtualmarriageME/screens/EarningScreen.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/carouselslider/carousel_slider.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading;

  bool isChatSwitched = true;
  bool isCallSwitched = false;

  @override
  void initState() {
    super.initState();

    getBanner();

  }

  void showInfo(title, message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              color: Color(0xFFEE829C),
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Color(0xFFEE829C),
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

    //double ratio = (itemWidth / itemHeight) + .13;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
           padding: EdgeInsets.fromLTRB(0, 10, 0, 10) ,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }
                        ),
                      )
                      ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ]
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Now your status is: ${isChatSwitched == true?'Online': 'Ofline'}",
                                          style:
                                          TextStyle(fontSize: 14, color: Colors.black)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Chat Status",
                                          style:
                                          TextStyle(fontSize: 18, color: Colors.black)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Switch(
                                        value: isChatSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isChatSwitched = value;
                                            makeOnline("chat", value);

                                          });
                                        },
                                        activeTrackColor: Color(0xFF88D969),
                                        activeColor: Color(0xFF1D800E),
                                      ),

                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          showInfo("Chat Info", "you can change the status for users, if you will set status offline then you will not reveive any message from users.");
                                        },
                                        child: Icon(
                                          Icons.info_outlined,
                                          color: Color(0xFFEE829C),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                              ],
                            )
                        ),

                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Now your call status is: ${isCallSwitched == true?'Online': 'Ofline'}",
                                          style:
                                          TextStyle(fontSize: 14, color: Colors.black)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Voice Call Status",
                                          style:
                                          TextStyle(fontSize: 18, color: Colors.black)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Switch(
                                        value: isCallSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isCallSwitched = value;
                                            makeOnline("call", value);
                                          });
                                        },
                                        activeTrackColor: Color(0xFF88D969),
                                        activeColor: Color(0xFF1D800E),
                                      ),

                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          showInfo("Call Info", "you can change the status for users, if you will set status offline then you will not reveive any voice from users.");
                                        },
                                        child: Icon(
                                          Icons.info_outlined,
                                          color: Color(0xFFEE829C),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                              ],
                            )
                        ),

                      ),
                    ],
                  ),
                ),

              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => EarningScreen(),),);
                        },
                        child: Container(
                            height: 80,
                            width: 140,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Total Earning",
                                    style:
                                    TextStyle(fontSize: 16, color: Colors.black)),
                                SizedBox(height: 10,),
                                Icon(
                                  Icons.money,
                                  color: Color(0xFFEE829C),
                                ),

                                    ],
                            )
                        ),
                      ),

                    ),

                    Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CustomerSupportScreen(),),);
                        },
                        child: Container(
                            height: 80,
                            width: 140,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Customer Support",
                                    style:
                                    TextStyle(fontSize: 16, color: Colors.black)),
                                SizedBox(height: 10,),
                                Icon(
                                  Icons.support_agent,
                                  color: Color(0xFFEE829C),
                                ),

                              ],


                            )
                        ),
                      ),

                    ),

                  ],

                ),
              )


              ],
            )
        ),
      ),
    );
  }

  void makeOnline(String type, bool isOnline){
    Api().makeOnline(context: context, type: '${type}', isOnline: '${isOnline}',).then((value) => {
      if(value.status != null) {

        print("make online successfull response"),

      }
    });
  }

  void getBanner() {
    /*Future<List<BannerData>> bannerlist = Api().getBanner(context: context);
    bannerlist.then((value) => {
      imgList.clear(),
      for(var i=0; i<value.length; i++){
        print("pic  " + value[i].pic),

        setState(() {
          imageSliders.length;
          imgList.add(value[i].pic);

        }),
      },



    });*/




  }

}

 //List<String> imgList = [];

final List<String> imgList = [
  'assets/banner/banner1.png',
  'assets/banner/banner2.png',
  'assets/banner/banner3.png',
  'assets/banner/banner4.png',
  'assets/banner/banner5.png',
  'assets/banner/banner6.png',
 ];

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            //Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Image.asset(item),
            /*Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                *//*child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),*//*
              ),
            ),*/
          ],
        )
    ),
  ),
)).toList();




