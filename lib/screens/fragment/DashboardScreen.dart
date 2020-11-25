
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtualmarriageME/screens/EarningScreen.dart';
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
                      ),
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
                                            //print("status==="+isChatSwitched.toString());
                                          });
                                        },
                                        activeTrackColor: Color(0xFFFADAE1),
                                        activeColor: Color(0xFFEE829C),
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
                                            //print("status==="+isChatSwitched.toString());
                                          });
                                        },
                                        activeTrackColor: Color(0xFFFADAE1),
                                        activeColor: Color(0xFFEE829C),
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

                  ],

                ),
              )


              ],
            )
        ),
      ),
    );
  }

}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
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
                /*child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),*/
              ),
            ),
          ],
        )
    ),
  ),
)).toList();




