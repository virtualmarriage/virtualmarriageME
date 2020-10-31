import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  bool isNotificationSwitched = true;
  bool isAgeSwitched = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
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
                            Text("Now your notification is: ${isNotificationSwitched == true?'On': 'Off'}",
                                style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Notification On/Off",
                                style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                            SizedBox(
                              width: 20,
                            ),
                            Switch(
                              value: isNotificationSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isNotificationSwitched = value;
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
                                showInfo("Notification Info", "you can change the notification, if you will set notification off then you will not reveive any notification from users.");
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

            SizedBox(height: 20,),

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
                            Text("Now your age is: ${isAgeSwitched == true?'Visible': 'Invisible'}",
                                style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Age Visible/Invisible",
                                style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                            SizedBox(
                              width: 20,
                            ),
                            Switch(
                              value: isAgeSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isAgeSwitched = value;
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
                                showInfo("Age Info", "you can visible and invisible age, if you will set age invisible then user can not see your age.");
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

   ]
        ),
      ),

    );
  }
}
