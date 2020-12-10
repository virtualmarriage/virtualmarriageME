import 'package:flutter/material.dart';

class IncomingCallScreen extends StatefulWidget {
  @override
  _IncomingCallScreenState createState() => _IncomingCallScreenState();
}

class _IncomingCallScreenState extends State<IncomingCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(70, 50, 70, 50),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text('Incoming Audio Call',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  SizedBox(height: 40,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/ic_audio_call.png"),
                    backgroundColor: Colors.grey,
                    radius: 70,

                  ),

                  SizedBox(height: 180,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              icon: new Image.asset('assets/ic_reject_call.png',
                               ),
                              tooltip: 'Reject Call',
                              iconSize: 60,
                              onPressed: () {

                              }

                          ),
                          Text('Reject',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),

                      Column(
                        children: [
                          IconButton(
                              icon: new Image.asset('assets/ic_accept_call.png',
                                ),
                              tooltip: 'Accept Call',
                              iconSize: 60,
                              onPressed: () {

                              }
                          ),
                          Text('Accept',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                    ],
                  )


                ],
              ),
            ),





          ],
        ),


      ),

    );
  }
}
