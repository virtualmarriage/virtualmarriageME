import 'package:flutter/material.dart';
import 'package:virtualmarriageME/utils/chips_choice.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {

  int tag = 1;
  List<String> tags = [];

  List<String> options = [
    'Bidi', 'Daru', 'Hukkka',
    'Hot Chat', 'Ghoomana', 'Trip',
    'Outing', 'Travel', 'Food', 'Coffee',
    'Meeting',
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100),
              child: Stack(
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/girl_image.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 330),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                        ),
                        child: Container(
                          //height: 500,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Anjali Sharma",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.home, color: Color(0xFFEE829C),),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Vasundhara Ghaziabad",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10,),
                                    Icon(Icons.tag_faces, color: Color(0xFFEE829C)),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: Text("If you’re really feeling inspired. I am intreasted in hot/sexy ;) chatting and call and looking best friend for trip out for NCR, I like so much hilly area.",
                                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.thumb_up,
                                        color: Color(0xFFEE829C)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "My Intrest",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),

                                  ],
                                ),
                                ChipsChoice<int>.single(
                                  value: tag,
                                  options: ChipsChoiceOption.listFrom<int, String>(
                                    source: options,
                                    value: (i, v) => i,
                                    label: (i, v) => v,
                                    disabled: (i, v) => [0, 2, 5].contains(i),
                                  ),
                                  onChanged: (val) => setState(() => tag = val),
                                  isWrapped: true,
                                ),

                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ))),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 300,
                height: 60,
                margin: EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5,),
                decoration: BoxDecoration(
                  color: Color(0xFFEE829C),
                  border: Border.all(
                    color: Color(0xFFEE829C),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    // to make elevation
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                          onTap: null,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.chat, color: Colors.white, size: 28,),
                              SizedBox(width: 5,),
                              Text("Chat",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                    Container(width: 1, color: Colors.white),
                    Expanded(
                      child: InkWell(
                        onTap: null,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.call, color: Colors.white, size: 28,),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Call",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            //SizedBox(width: 15,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Profile Detail",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context)),
      backgroundColor: Colors.white,
    );
  }
}
